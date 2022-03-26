require("TSLib")
ts=require("ts")
require("INS数据")
require("界面")
require("爱新机数据")
json = ts.json--使用 JSON 模块前必须插入这一句
init(0,0)

--------------ShowUI--ID--------------------
local 脚本功能 = values.脚本功能
local 接口序 = values.接口序
local 电话号接口 = values.电话号接口  
local 电话号接口2 = values.电话号接口2
local 电话号接口3 = values.电话号接口3
local 电话号接口4 = values.电话号接口4
local 注册数量 =  values.注册数量
local 防卡时间 =  values.防卡时间
local 指定密码 =  values.指定密码
local 文件路径 = values.文件路径
local 文件名称 = values.文件名称
local 注册间隔 = values.注册间隔
local 使用软件 = values.使用软件
local 上传头像 = values.上传头像
---------登录操作ID----------
local 手动获取代理 = values.手动获取代理
local 代理链接 = values.代理链接
local 号码地区 = values.号码地区

require("基础函数")
require("功能函数")
require("逻辑函数")


local thread = require('thread')

--防锁屏
setAutoLockTime(0)


--ui设置
if UIret == 1 then
	mSleep(1000)
function 全局设置()
	---判断代理是否填写  VPN操作---
	if values.手动获取代理 == 'on' then  		--------手动设置S5代理------
		toast("手动设置代理已经开启")
		mSleep(500)
		关闭VPN()
		删除手动设置的代理()
		获取S5代理()
		手动设置代理()
		切换VPN()
		打开VPN()
	else
		关闭VPN()
		切换VPN()
		打开VPN()
	end				

	-------------2、软件适配------------
	if values.使用软件 == '0' then  		
		启动爱新机()
		mSleep(1000)
		一键新机()
		mSleep(5000)
	elseif values.使用软件 == '1' then  
	    PyApp新机坐标版本()
	     mSleep(1000)
	else
		mSleep(1000)
	end
	
    ----判断间隔时间是否大于等于60------	
    if tonumber(values.注册间隔) < 60 then
        dialog("为保证流程正常运行，间隔时间应该大于等于【60】秒",{title = "参数设置错误",button = "退出重新设置"})
        lua_exit()
    else
        mSleep(100)
    end
    ----判断放卡时间是否大于等于300------
    if tonumber(values.防卡时间) < 300 then
        dialog("为保证流程正常运行，防卡时间应该大于等于 5 分钟",{title = "参数设置错误",button = "退出重新设置"})
        lua_exit()
    else
        mSleep(100)
    end
    ---判断手机号接口的填写是否合法--------
    if values.电话号接口 ~= '' and values.电话号接口2 ~= '' and values.电话号接口3 ~= '' then
        dialog("接口地址填写有误，请确保三项地址三选一,脚本退出",{title = "地址设置错误",button = "退出重新编辑"})
        lua_exit()
    else
        mSleep(1000)
    end
    
    ----判断密码是否随机----
    if values.指定密码 == '' then 
        toast("密码随机",1)
        mSleep(1000)
    else 
        toast("已设置指定密码"..values.指定密码,1)
        mSleep(1000)
    end
    ----判断昵称文件是否指定----
    if values.文件名称 == '' then
        toast("昵称随机",1)
        mSleep(500)
else 
    toast("指定本地昵称文件",1)
    mSleep(500)
end			
end

function 流程()
	if values.脚本功能 == '0' then 		----以下是APP注册账号的主要流程----------
		toast("当前功能为--INS--APP注册",1)
		mSleep(500)
		-----------注册主要逻辑程序-----------	
		全局设置()
		打开再关闭()
	--	INS防闪退启动()
		INSAPP注册()
		--上传账号()
		全局变量1=1     --注册成功
		记录账号信息()  --记录注册成功的账号到本地
		--设置资料()
		if values.上传头像 == 'on' then 
			设置头像()
		else
			mSleep(1000)
		end
		
	else 	   ----以下是浏览器注册账号的主要流程----------
		toast("当前功能为--INS--浏览器注册",1)
		mSleep(500)
       	全局设置()
	    浏览器输入网站()
		INS浏览器注册()
		--全局变量1=1     --注册成功
		记录账号信息()  --记录注册成功的账号到本地
		移动cookies()   --移动cookie文件到指定目录 /private/var/mobile/INSCookies
		if values.上传头像 == 'on' then 
			设置头像()
		else
		    mSleep(1000)
		end
	end
end

-------------防卡-------------------------
for var = 1, 注册数量 do
	local thread_id = thread.create(
		function()
			流程()
			--主程序()
		end,{
			callBack = function()
				--协程结束会调用，不论是错误、异常、正常结束
				--toast("我结束了")
			end,
			catchBack = function(exp)
				--协程异常结束,异常是脚本调用了 throw 激发的，exp 是 table,exp.message 是异常原因
				toast("超时或者异常")
			end
		})
	mSleep(1000)
	
	---------------------下面是倒计时，通过全局变量1调用------------------
	local 防卡倒计时
	local 注册等待 = values.注册间隔 * 1000
	for  ii= 1,values.防卡时间/10,1 do
		防卡倒计时=(60-ii+1)*10
		--toast('防卡倒计时：'..防卡倒计时..'秒',1)
		mSleep(5000)
		if 全局变量1==1 then
			toast('注册成功，重新计时',1)
			--停止脚本
			--lua_exit()
			toast('注册成功等待'..((注册等待/1000)/60)..'分钟')
			mSleep(注册等待)   -- 注册完成等待
			break
		elseif 全局变量1==2 then
		    toast('注册异常，重新开始',1)
			break
		elseif 全局变量1==3 then
			toast('网络或者新机问题导致账号注册异常，脚本重新开始',1)
			break
		end
		mSleep(5000)
		if ii==防卡时间/10 then
			toast('流程超时',1)
			全局变量1=2
		end
	end
	mSleep(500)
	thread.setTimeout(1000,thread_id)
	--等待所有协程结束
	thread.waitAllThreadExit()
	mSleep(1000)
	if 全局变量1==2 then
		释放电话号码()
		--切换VPN()
	end
	全局变量1=0
	mSleep(500)
end

else
	toast("取消操作")
	return false
end

