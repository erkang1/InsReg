-- function 切换VPN()--启动小火箭  --判定打开VPN  --切换VPM  -- 判定有无网络
-- 	local 节点数量
-- 	打开应用('com.liguangming.Shadowrocket',3000)
-- 	for var= 1,100 do--说明启动了小火箭
-- 		x,y = findMultiColorInRegionFuzzy(0x2473bd, "301|-3|0x2473bd,444|-28|0xffffff,-217|-28|0xffffff,-180|-51|0xffffff,-191|-41|0x2473bd,-192|-18|0x2473bd,438|-12|0x2473bd,452|-19|0x2473bd,461|-29|0xffffff",90,30,60,714,115)
-- 		if x>0 then 
-- 			break
-- 		end
-- 		mSleep(2000)
-- 	end
-- 	for var= 1,10 do --小火箭开关开启
-- --		if (isColor( 643,  204, 0x2473bd, 85)) then  --旧版本
-- 		if (isColor( 612,  209, 0x2372bd, 85)) then  --6以上版本
-- 			break
-- 		else
-- 			tap(622,205)
-- 			mSleep(2000)
-- 		end
-- 	end
-- 	for i= 0,7 do --判断节点数量
-- 		--x,y = findColorInRegionFuzzy(0x000000,100,118,558+i*88,219,589+i*88) --旧版本不需要更改
-- 		x,y = findColorInRegionFuzzy(0xffffff ,100,649,628+i*88, 678,1096+i*88)
-- 		if x<0 then --说明没有节点了
-- 			节点数量=i
-- 			break
-- 		end
-- 	end
-- 	local 随机节点序
-- 	if 节点数量~=1 then
-- 		for var= 1,10 do
-- 			随机节点序=math.random(0,节点数量-1)--去重复，万一随机的还是那个呢
-- --			if (isColor(13,581+随机节点序*88,0xff9400,85)) then      --旧版本
--             if (isColor(  43,  638+随机节点序*88, 0xff9400, 85)) then   --6以上版本
-- 			else
-- 				break
-- 			end
-- 		end 
-- --		tap(325,574+随机节点序*88)    --旧版本
-- 		tap(346,627+随机节点序*88)    --6以上版本
-- 		mSleep(2000) 
-- 	end
-- 	--判断有没有网络
-- end

function 切换VPN()--启动小火箭  --判定打开VPN  --切换VPM  -- 判定有无网络   --兼容12以及以上的系统
    local 节点数量
    打开应用('com.liguangming.Shadowrocket',3000)
    for var= 1,100 do--说明启动了小火箭
        x,y = findMultiColorInRegionFuzzy(0x2473bd, "301|-3|0x2473bd,444|-28|0xffffff,-217|-28|0xffffff,-180|-51|0xffffff,-191|-41|0x2473bd,-192|-18|0x2473bd,438|-12|0x2473bd,452|-19|0x2473bd,461|-29|0xffffff",90,30,60,714,115)
        if x>0 then 
            break
        end
        mSleep(2000)
    end
    for var= 1,10 do --小火箭开关开启
        local ios12 = isColor( 643,  204, 0x2473bd, 85)
        local ios13 = isColor( 612,  209, 0x2372bd, 85)
        if values.系统版本=='0' and ios12 then 
            --dialog("123")
            break
        elseif values.系统版本=='1' and ios13 then
            break
        else
            touchDown(669,203)
            mSleep(500)
            touchUp(669,203)
            mSleep(2000)
        end
    end

    for i= 0,7 do --判断节点数量
        --x,y = findColorInRegionFuzzy(0x000000,100,118,558+i*88,219,589+i*88)   --旧版本不需要更改
        x,y = findColorInRegionFuzzy(0xffffff ,100,649,628+i*88, 678,1096+i*88)
        if x<0 then --说明没有节点了
            节点数量=i
            --dialog(节点数量)
            break
        end
    end
	
    local 随机节点序
    if 节点数量~=1 then
        for var= 1,10 do
            随机节点序=math.random(0,节点数量-1)         --去重复，万一随机的还是那个呢
            local isios12 = isColor(13,581+随机节点序*88,0xff9400,85)
            local isios13 = isColor(43,638+随机节点序*88,0xff9400,85)
            if values.系统版本=='0' and isios12 then 
                toast("代理已切换-ios12")
            elseif values.系统版本=='1' and isios13 then 
                toast("代理已切换")
            else
                break
            end
        end
        
        if values.系统版本 =='0' then
          	tap(368,645+随机节点序*88)     --旧版本 12系统
            mSleep(2000)
        else
            tap(346,627+随机节点序*88) 
            mSleep(2000) 
        end
    end
end
------------------------------------------------

function 选择生日()
moveTo(选择月[1],选择月[2]+math.random(0,30) ,选择月[3],选择月[4]+math.random(0,30))
mSleep(1000)
moveTo(选择日[1],选择日[2]+math.random(0,30) ,选择日[3],选择日[4]+math.random(0,30))
mSleep(1000)
for var=1,3 do
	moveTo(选择年[1],选择年[2],选择年[3],选择年[4])
	mSleep(2000)
end
moveTo(选择年[1],选择年[2]+math.random(50,100)+50 ,选择年[3],选择年[4]+math.random(0,50)-50)
mSleep(3000)
end


function 打开再关闭()
	打开应用(INS,1000)
	mSleep(2000)
	toast("准备关闭")
	mSleep(1000)
	关闭应用("com.burbn.instagram")
	mSleep(1000)
	打开应用(INS,3000)
end


function PyApp新机坐标版本()
	mSleep(500)
	关闭应用('com.hd.PyApp')
	toast("已经关闭新机")
	mSleep(1000)
	打开应用('com.hd.PyApp',2000)
	mSleep(3000)
	--tap(新机按钮X,新机按钮Y)
	touchDown(新机按钮X,新机按钮Y)
	mSleep(30)
	touchUp(新机按钮X,新机按钮Y)
	mSleep(3000)
	toast("点击新机 ")
	mSleep(1000)
	--tap(确定新机X,确定新机Y)
	touchDown(确定新机X,确定新机Y)
	mSleep(30)
	touchUp(确定新机X,确定新机Y)
	mSleep(3000)
	toast("确认新机 ")
	mSleep(6000)
end


function One_Press()
    os.execute("/usr/local/bin/onepress_lite -b org.mozilla.ios.Firefox -C -o")
    mSleep(1000)
    输入文本2(445,103,"www.instagram.com")
    mSleep(1000)
    tap(684,1273,80,"click_point_5_2.png",1)
    mSleep(2000)
end


function 备份还原清理()
    关闭应用(INS)
	打开应用('com.3btest.BackUpApp',2000)
    toast("关闭重新打开")
	mSleep(1000)
	关闭应用("com.3btest.BackUpApp")	    --避免出现 连接服务器失败导致无法清理的问题
	打开应用('com.3btest.BackUpApp',2000)
	mSleep(2000)
    -- tap(388,601,50,"click_point_5_2.png",1)   --旧版本
    -- tap(381,418,50,"click_point_5_2.png",1) --2.0.5版本
    tap(389,478,50,"click_point_5_2.png",1) --2.0.10版本
    -- local 包名检查 = ocrText(273,118,560,159,0)   --识别com.burbn.instagram文字   如果不是ins  就停止脚本并给提示
    -- -- nLog(包名检查)
    -- if 包名检查 == "com.burbn.instagram" then
    --     mSleep(2000)
    --     tap(388,601,50,"click_point_5_2.png",1)
    -- else
    --     dialog("请在备份还原软件内APP包名处选择INS")
    --     全局变量1=2
    -- end
    mSleep(3000)
end



function INSAPP注册()
	while (true) do
	    local app_reg = ocrText(80,110,666,157,0)   --识别Enter the Code We Sent to文字
	    local app_username = ocrText(193,104,559,161,0)   --识别Add Your Name文字
	    local app_username2 = ocrText(175,106,578,157,0)   --识别Create username文字
	    local app_pwd = ocrText(158,108,591,162,0)   --识别Create a Password文字
	    local app_signup = ocrText(82,199,654,238,0)   --识别You can always change your username later文字
	    local app_skip = ocrText(337,1272,413,1310,0)   --识别Skip文字
	    local app_onskip = ocrText(196,780,279,829,0)   --识别弹框内容Skip文字
	    local app_discover = ocrText(231,58,521,108,0)   --识别Discover People / people文字
	    local app_error = ocrText(305,801,447,850,0)   --识别Dismiss文字
	    local app_notifications = ocrText(160,772,319,823,0)   --识别Not Now /now文字
	    local app_suspend = ocrText(57,227,691,277,0)  --识别We suspended your account文字
	    local app_feedback = ocrText(64,417,288,447,0)  --识别feedback_required文字
	    local app_birthday = ocrText(171,330,593,393,0)  --识别Add Your Birthday文字
	    
		local 当前界面=检索界面(INS注册界面列表)
		if 当前界面 == "INS注册开屏界面" then
			tap(创建用户按钮X+math.random(1,10),创建用户按钮Y+math.random(1,10))
			mSleep(500)
		elseif app_error == "Dismiss" then
		    mSleep(1000)
            全局变量1=2
        elseif app_onskip == "Skip" or 当前界面 == "APP弹框跳过界面"  then    --点击无效 
		    mSleep(1000)
		    tap(237,808,80,"click_point_5_2.png",1)
		    mSleep(1000)
		elseif 当前界面 == "APP注册登录界面3" then 
		    tap(370,704,50,"click_point_5_2.png",1)
		    mSleep(1000)
		elseif 当前界面 == "INS注册登录界面" then
			--点击注册按钮
			tap(注册按钮X+math.random(1,10),注册按钮Y+math.random(1,10))
			mSleep(500)
		elseif app_feedback == "feedback_required" then 
		     mSleep(1000)
		     全局变量1=2
        elseif 当前界面 == "APP手机号注册界面1" or 当前界面 == "INS注册手机号注册界面" or 当前界面 == "APP输入手机号界面" then
			mSleep(2000)
			--isColor(271, 405, 0xed4956, 90)    --169
			if (isColor(267, 315, 0xff1b34, 90)) or isColor(271, 405, 0xed4956, 90) then
			    mSleep(2000)
                全局变量1=2
            end
			if values.号码地区 == '0' then 
				-- tap(163,365)  
				tap(151,394)
				for var= 1, 10 do     --印尼地区+62
					向上翻页()
					--mSleep(100)
				end
				tap(389, 670)
				mSleep(500)
			elseif values.号码地区 == '1' then
				-- tap(163,365)
				tap(151,394)
				for var= 1, 17 do     --俄罗斯地区+7
					向上翻页()
				end
				tap(335, 820)
			elseif values.号码地区 == '3' then
				-- tap(163,365)
				tap(151,394)
				for var= 1, 4 do     --柬埔寨地区+855
					向上翻页()
				end
				tap( 294,  593)
			end	
			if values.接口序=='0' then
				电话号码=获取电话号码()
			elseif values.接口序=='1' then
				电话号码=获取手机号和ID2()
			elseif values.接口序=='2' then
				电话号码 = 获取电话号码3()
			end
			输入文本2(手机号输入框X,手机号输入框Y,电话号码)   --inputText 版本
			mSleep(1000)
			tap(NEXT按钮X+math.random(1,10),NEXT按钮Y+math.random(1,10))	--next 按钮
			mSleep(5000)
			判断是否离开该界面(INS注册界面列表,'INS注册手机号界面')
			
		elseif 当前界面 == "INS注册验证码界面" or app_reg =="Enter the Code We Sent to"  then
			mSleep(1000)
			local 验证码
			for var= 1,7 do
				tap(630,1276)
				mSleep(500)
			end
			mSleep(1000)	
			if values.接口序=='0' then
				验证码=获取验证码()
			elseif values.接口序=='1' then
				验证码=获取验证码2()
			elseif values.接口序=='2' then
				验证码=获取验证码3()
			else
				mSleep(1000)
			end
			mSleep(1000)
			--dialog("获取到的验证码："..验证码) 
			小键盘输入(验证码)
            tap(428,518)   --169版本
            -- tap(430,570)  --240.0
			mSleep(5000)
			
		elseif 当前界面 == "INS注册手机号出错界面" then
			--清除输入框内容
			tap(清除按钮X,清除按钮Y)
			mSleep(500)
		elseif 当前界面 == "INS注册设置用户名界面" or app_username == "Add Your Name"  or app_username2 == "Create username"  then 
			mSleep(3000)			
			if values.文件名称 == '' then
				mSleep(1000)
				名字 = 随机用户名(8)
			else
				toast("获取到文件！")
				名字 = 随机用户昵称()
			end
			tap(657,373)
			mSleep(800)
			输入文本2(用户名输入框X,用户名输入框Y,名字)   --input方法
			mSleep(3000)
			tap(NEXT按钮X,NEXT按钮Y)
		elseif 当前界面 == "INS注册设置密码界面" or app_pwd == "Create a Password" or app_pwd == "Create a password" then 
			mSleep(1000)
			随机账号密码()
			mSleep(1000)
			输入文本(310,353,密码)
			mSleep(2000)
			tap(419,550)  --点击下一步
			mSleep(500)
		elseif 当前界面 == "INS注册记住登录信息界面" then 
--			tap(486, 1192)  -- remenber
--			mSleep(500)
			tap(368,1292)  -- not now
			mSleep(3000)
		elseif 当前界面 == "INS注册选择生日界面" or app_birthday == "Add Your Birthday" then
			选择生日()
			tap(注册next生日X,注册next生日Y)
			mSleep(3000)
		elseif 当前界面 == "INS注册设置用户名界面" or app_username == "Create Username" then
			mSleep(3000)
			if multiColor({{用户名对勾X,用户名对勾Y,对勾的颜色}},90,false) == true  then --说明用户名可以用	
				tap(NEXT按钮X,NEXT按钮Y)
				mSleep(8000)
				return true
			elseif (isColor( 362,  402, 0xff3350, 85)) then
				tap( 460,  357)
				mSleep(1000)
				for var= 1,20 do
					tap(630,1276)
					mSleep(500)
				end
				if values.文件名称 == '' then
					mSleep(500)
					名字 = 随机用户名(8)
				else
					toast("获取到文件！")
					名字 = 随机用户昵称()
				end
				tap(657,373)
				mSleep(800)
				输入文本(用户名输入框X,用户名输入框Y,名字)
				mSleep(3000)
				tap(NEXT按钮X,NEXT按钮Y)
			else
				mSleep(500)
				tap(642, 358) --点击 随机 按钮
			end
		elseif 当前界面 == "APP确认用户名界面2" then 
		    mSleep(1000)
		    tap(447,1187)
		    mSleep(1000)
		elseif 	当前界面 == "INS注册确定界面"  or 当前界面 == "APP注册确定用户名界面" then 
			tap(472,  342)  --点击sign up --169.0
			mSleep(5000)
	    elseif app_signup == "You can always change your username later" and (isColor(530, 328, 0x0095f6, 90)) then 
		    mSleep(1000)   --点击sign up --169.0
		    tap(472,342)
		    mSleep(1000)		
		elseif app_signup == "You can always change your username later" then 
		    mSleep(1000) --点击sign up --240.0
		    tap(476,1192)
		    mSleep(1000)
		elseif app_skip == "Skip" then
		    mSleep(1000)
		    tap(369,1293)
		  --  mSleep(1000)
		elseif  当前界面 == "INS注册Facebook好友界面"  then 
			mSleep(1000)
			tap(Skip按钮X,Skip按钮Y)
			mSleep(500)
			tap(弹框Skip按钮X,弹框Skip按钮Y)		
		elseif 当前界面 == "INS注册授权通讯录界面" then 
			mSleep(1000)
			tap(Skip按钮X,Skip按钮Y)
			mSleep(500)
			tap(弹框Skip按钮X,弹框Skip按钮Y)
		elseif 当前界面 == "INS注册通知管理界面"  then 
			mSleep(1000)
			tap(Skip按钮X,Skip按钮Y)
			mSleep(500)
			tap(弹框Skip按钮X,弹框Skip按钮Y)
		
		elseif  当前界面 == "INS注册设置头像界面" then 
			tap(Skip按钮X,Skip按钮Y)
			mSleep(500)			
		elseif  当前界面 == "INS注册推荐好友界面" then 
			tap(696,81)
			mSleep(500)	
		elseif app_discover == "Discover People" or app_discover == "Discover people" then
            -- mSleep(1000)
            tap(684,85)
            mSleep(1000)
		elseif 当前界面 == "APP用户被封禁" or app_suspend == "We suspended your account" then 
		    mSleep(2000)
            全局变量1=6
		elseif app_notifications == "Not Now" or app_notifications == "Not now" then
            -- mSleep(1000)
            tap(243,798)
            mSleep(1000)
            
			tap(668, 1282) --点击 “我”
			mSleep(500)
		elseif 当前界面 == "INS注册成功主界面" then
			tap(668, 1282) --点击 “我”
			mSleep(500)
		elseif 当前界面 == "APP个人主页界面界面" or 当前界面 == "INS浏览器个人主页界面" or 当前界面== "APP个人主页界面界面2"  then
			break
		else
			mSleep(1000)
		end
	end
end
-------------------------APP--INS注册----------------------------------------

function 浏览器输入网站()
    if values.脚本功能 == '1' then
    	打开应用("com.google.chrome.ios",1000)
    	mSleep(3000)
    	while (true) do
    		    local 当前界面=检索界面(INS注册界面列表)
        		if 当前界面 == "google浏览器条款界面" then
        		    mSleep(2000)
        		    --tap(接受按钮X,接受按钮Y)
        		    tap(324,1242)
        		    mSleep(2000)
        		elseif  当前界面 == "google浏览器同步界面" then
        		   mSleep(2000)
    		      -- tap(不同步按钮X,不同步按钮Y)
    		      tap(132,1270)
        		   mSleep(2000)
        		elseif 当前界面 == "google浏览器添加账户界面" then
     		      tap(137,1268)
        		   mSleep(2000)
        		elseif  当前界面 == "google浏览器登录界面" then
        		   mSleep(2000)
    		       --tap(google浏览器登录X,google浏览器登录Y)
    		       tap(379,1263)
        		   mSleep(2000)
        		elseif  当前界面 == "google浏览器定位界面" or 当前界面 == "google浏览器定位界面2"  then
        		   mSleep(2000)
    		       --tap(google浏览器定位不允许按钮X,google浏览器定位不允许按钮Y)
    		       tap(374,1283)
        		   mSleep(2000)
        		elseif  当前界面 == "google浏览器设置iphone界面" then
        		   mSleep(2000)
    		       --tap(google浏览器设置iphone界面接受按钮X,google浏览器设置iphone界面接受按钮Y)
    		       tap(414,1247)
        		   mSleep(2000)   
        		else
        		      break
        		end
    	    end
    elseif values.脚本功能 == '2' then
        打开应用("org.mozilla.ios.Firefox",1000)
    	mSleep(6000)     --注意延时，主要是用于规避应用是否卡顿或者闪退
        while (true) do
            local 主页 = ocrText(279,132,466,166,0)   --识别Browser文字
            local 底部文字 = ocrText(274,1173,401,1201,0)  --识别底部文字 address
            local 主页2 = ocrText(281,433,465,464,0)   --识别Browser文字
            local 设置 = ocrText(123,1183,251,1222,0)   --识别Settings文字
            local 当前界面=检索界面(火狐浏览器界面列表)
         	if 当前界面 == "火狐浏览器首次登录页面" then
         	    mSleep(2000)
         	    tap(367,1248,80,"click_point_5_2.png",1)
         	  --  tap(678,67,80,"click_point_5_2.png",1)
         	    mSleep(1000)
        	elseif 当前界面 == "火狐浏览器设备共享页面" then
         	    mSleep(2000)
         	    tap(346,1286,80,"click_point_5_2.png",1)
         	    mSleep(3000)
     	        tap(677,179,80,"click_point_5_2.png",1) --点击空白位置，收起弹框
     	        mSleep(2000)
        	elseif 当前界面 == "火狐浏览器底部搜索界面" then
     	        mSleep(2000)
     	        tap(677,179,80,"click_point_5_2.png",1) --点击空白位置，收起弹框
     	        mSleep(2000)
     	        tap(676,1287,80,"click_point_5_2.png",1) --点击设置设置图标
     	        mSleep(1000)
     	  	elseif 当前界面 == "火狐浏览器底部搜索界面2" then
     	  	    mSleep(2000)
     	        tap(676,1287,80,"click_point_5_2.png",1) --点击设置图标
     	        mSleep(1000)
     	  	elseif 主页2 == "Learn How" and 底部文字 == "address" then
     	  	    mSleep(2000)
     	        tap(676,1287,80,"click_point_5_2.png",1) --点击设置图标
     	        mSleep(1000)     	  	    
     	  	elseif 主页 == "Browser" and 底部文字 == "address"  then 
     	  	    mSleep(2000)
     	        tap(676,1287,80,"click_point_5_2.png",1) --点击设置设置图标
     	        mSleep(1000)
     	  --	elseif 当前界面 == "火狐浏览器设置界面" then
     	    elseif 设置 == "Settings" then
     	  	    mSleep(1000)
     	  	    tap(281,1194,80,"click_point_5_2.png",1)  --点击设置
     	  	    mSleep(2000)
     	  	elseif 当前界面 == "火狐浏览器设置内部界面" then   	  
  	  	        mSleep(2000)
  	  	        tap(446,947,80,"click_point_5_2.png",1) --点击 ToolBar
  	  	        mSleep(1000)
  	  	        tap(276,220,80,"click_point_5_2.png",1) --点击 top
  	  	        mSleep(2000)
 	  	        
  	  	        tap(84,82,80,"click_point_5_2.png",1)   --点击返回
  	  	        mSleep(2000)
  	  	        tap(665,85,80,"click_point_5_2.png",1)  --点击done
  	  	        mSleep(2000)
  	  	        toast("火狐设置完成")
     	  	elseif 当前界面 == "火狐浏览器设置内部界面2" then
     	  	    mSleep(2000)
     	  	    tap(453,1222,80,"click_point_5_2.png",1) --点击 ToolBar
  	  	        mSleep(1000)
  	  	        tap(276,220,80,"click_point_5_2.png",1) --点击 top
  	  	        mSleep(2000)     	  	   
   	  	        tap(84,82,80,"click_point_5_2.png",1)   --点击返回
  	  	        mSleep(2000)
  	  	        tap(665,85,80,"click_point_5_2.png",1)  --点击done
  	  	        mSleep(2000)
  	  	        toast("火狐设置完成2")	  	        
     	  --	elseif 当前界面 == "未知界面" then   	  
  	  	  --      mSleep(2000)
            elseif 当前界面 == "火狐浏览器顶部设置界面" or 当前界面 == "火狐浏览器顶部设置界面2" then
                mSleep(2000)
                输入文本2(445,103,"www.instagram.com")
                mSleep(1000)
                tap(684,1273,80,"click_point_5_2.png",1)
                mSleep(2000)
                toast("火狐设置完成2")
                break
         	else
         	    break
         	end
        end
    elseif  values.脚本功能 == '3' then
        打开应用("com.apple.mobilesafari",1000)
        
        
         mSleep(1000)
    	 tap(445,103)       --点击输入框
    	 --dialog("点击输入框")
    	 mSleep(2000)
    	 tap(698,1173)      --点击删除按钮
    	 --dialog("点击删除按钮")
    	 mSleep(2000)
    	 输入文本2(445,103,"www.instagram.com")
    	 mSleep(1000)
    	 tap(684,1273)
    	 mSleep(6000)
    else
        mSleep(1000)
    end
end


function INS浏览器注册()
	--打开INS应用  自动进入到了INS注册主界面  
    while (true) do
        local safari_notcon = ocrText(132,386,614,435,0)   --识别Safari could not open the page   /  Safari cannot open the page文字
        local safari_country = ocrText(253,161,503,207,0)   --识别Select Country文字
        local safari_register = ocrText(302,165,451,207,0)   --识别Register文字
        local safari_Welcome = ocrText(143,270,280,307,0)   --识别Welcome文字
        local safari_Change = ocrText(244,476,510,519,0)   --识别Change username文字
        local safari_story = ocrText(29,384,163,417,0)   --识别Your Story 文字
        local safari_usernameon = ocrText(172,338,585,378,0)   --识别Find people to follow and start文字
        local safari_enterusername = ocrText(194,274,556,312,0)   --识别Enter name and password文字
        local safari_day = ocrText(242,492,513,537,0)   --识别Add Your Birthday文字
		local 当前界面=检索界面(INS注册界面列表)
		if  当前界面 == "google浏览器主页界面" then     --输入地址，需要优化
        	mSleep(2000)
            输入文本(357,501,"www.instagram.com")
        	mSleep(1000)
        	tap(646,1289)
        	mSleep(1000)
		elseif safari_notcon == "Safari could not open the page" or safari_notcon=='Safari cannot open the page' then    --无网络
		    mSleep(1000)
            全局变量1=4
		elseif 当前界面 == "INS浏览器注册欢迎界面" then
		    mSleep(500)
		    tap(浏览器注册按钮X,浏览器注册按钮Y)
		    mSleep(500)
		elseif 当前界面 == "INS浏览器注册欢迎界面2" then
		    mSleep(500)
		    tap(浏览器注册2按钮X,浏览器注册2按钮Y)
		    mSleep(500)
	    elseif 当前界面 == "google浏览注册界面2" then
		    mSleep(500)
		    --tap(注册界面2X,注册界面2Y)
		    tap(567,1091)
		    mSleep(1000)
		elseif 当前界面 == "INS浏览器注册界面" or 当前界面 == "浏览器手机号注册界面01" or 当前界面 == "浏览器手机号注册界面02"  then
		    mSleep(200)
            if values.注册类型=="0" then    --邮箱注册
                toast("脆球邮箱接码")
                mSleep(500)
                tap(519,413) 
                mSleep(1000)
                --adminsygs@5jdj.com
                邮箱号码 = values.邮箱前缀 .. 随机脆球后缀() .. "@" .. values.邮箱后缀
                输入文本2(341,563,邮箱号码)
                mSleep(1000)
                tap(407,701)
                mSleep(2000)
                --获取email内容()
    	        local error_mes = ocrText(96,534,157,557,0)   --接码错误
                if error_mes == "Sorry" then
                    mSleep(3000)
                    全局变量1=3
                    mSleep(5000)
                end                
            elseif values.注册类型=="1" then
                toast("开始手机号接码注册")
                
                if  values.手机型号 == '0' then      --判断手机型号，6S设备点击位置不一样
                        toast("6S型号")
                        浏览器选择地区输入框X = 268
                        浏览器选择地区输入框Y = 199
                else
                        toast("其他型号")
                        浏览器选择地区输入框X = 201
                        浏览器选择地区输入框Y = 263
                end          

function 手机型号区号点击判断()
    if  values.手机型号 == '0' then
        -- tap(163,492,80,"click_point_5_2.png")    --点击选择地区按钮
        tap(154,552,80,"click_point_5_2.png")       --点击选择地区按钮
        mSleep(500)
    else
        tap(154,552,80,"click_point_5_2.png")    --点击选择地区按钮
        mSleep(500)
    end                    
end
                if values.号码地区 == '0' then 
                    手机型号区号点击判断()
                    if values.脚本功能 =='1' or values.脚本功能 =='3' then
                        输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Indonesia")
                        mSleep(2000)
                        -- tap(236,447)    --点击印尼
                        tap(219,363)
                        mSleep(500)
                    elseif values.脚本功能 =='2' then 
                        输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"Indonesia")
                        mSleep(2000)
                        tap(236,373)    --点击印尼
                        mSleep(500)
                    end
                elseif values.号码地区 == '1' then
                    手机型号区号点击判断()
                    if values.脚本功能 =='1' or values.脚本功能 =='3' then 
                        输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Russia")
                        -- tap(175,357)    --点击俄罗斯
                        tap(219,363)
                        mSleep(500)
                    elseif values.脚本功能 =='2' then 
                        输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"Russia")
                        mSleep(2000)
                        tap(236,373)    --点击 俄罗斯
                        mSleep(500)
                    end
                    
                elseif values.号码地区 == '2' then 
                    手机型号区号点击判断()
                    if values.脚本功能 =='1' or values.脚本功能 =='3' then 
                        输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"United")
                        -- tap(402,581)   --点击美国
                        tap(219,363)
                        mSleep(500)
                    elseif values.脚本功能 =='2' then 
                        输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"United")
                        mSleep(2000)
                        tap(402,581)    --点击美国
                        mSleep(500)
                    end
                    
               elseif values.号码地区 == '3' then 
                    手机型号区号点击判断()
                    if values.脚本功能 =='1' or values.脚本功能 =='3' then 
                        输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Cambodia")
                        tap(219,363)  --点击 柬埔寨
                        mSleep(500)
                    elseif values.脚本功能 =='2' then 
                        输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"Cambodia")
                        mSleep(2000)
                        tap(236,373)    --点击 柬埔寨
                        mSleep(500)
                    end
                else
                    mSleep(500)
                end
    		    mSleep(1000)
    		   if values.接口序=='0' then
    				电话号码=获取电话号码()
    			elseif values.接口序=='1' then
    				电话号码=获取手机号和ID2()
    			elseif values.接口序=='2' then
    				电话号码 = 获取电话号码3()
    			elseif values.接口序=='3' then
    				电话号码=获取手机号和ID4()
    			end
        			输入文本2(449,546,电话号码)   --inputText 版本
        			mSleep(1000)
        			tap(534,697)	--next 按钮
        			mSleep(5000)

    			if (isColor(220, 438, 0xed4956, 90)) then  --环境出错，线程结束并释放号码
                    toast("行为出错，重新开始脚本")
                    mSleep(3000)
                    全局变量1=2 
    			end
            end
			判断是否离开该界面(INS注册界面列表,'INS浏览器注册界面')
		elseif 当前界面 == "INS浏览器接收验证码界面" or 当前界面 == "INS注册验证码界面2"  then
		    mSleep(2000)
		    for var=1,10 do
		        if (isColor(290, 448, 0xed4956, 90)) then
		            toast("接受验证码失败")
                    mSleep(10000)
                    tap(INS浏览器ResendSMSX,INS浏览器ResendSMSY)
                else
                    break
                 end
		    end
		   -- tap(INS浏览器ResendSMSX,INS浏览器ResendSMSY)
		    mSleep(1000)
			local 验证码
			mSleep(1000)
			if values.注册类型 =="0" then
			       验证码=获取email内容()    --脆球邮箱验证码
		    elseif values.注册类型 =="1" then
    			if values.接口序=='0' then
    				验证码=获取验证码()
    			elseif values.接口序=='1' then
    				验证码=获取验证码2()
    			elseif values.接口序=='2' then
    				验证码=获取验证码3()
    			elseif values.接口序=='3' then
    				验证码=获取验证码4()
    			else
    				mSleep(1000)
    			end
    		else
    		    
    		end
			mSleep(1000)
			--dialog("获取到的验证码："..验证码) 
			输入文本2(355+math.random(1,10),492+math.random(1,10),验证码)   --
			tap(365,615)
			mSleep(5000)
            判断是否离开该界面(INS注册界面列表,'INS浏览器接收验证码界面') 
        elseif  当前界面 == "INS浏览器设置用户名界面" or safari_enterusername == "Enter name and password" then
            if values.文件名称 == '' then
                mSleep(500)
                --dialog("xxxxx")
                名字 = 随机用户名(8)
            else
                toast("获取到文件！")
                名字 = 随机用户昵称()
            end
            mSleep(2000)
            输入文本(164+math.random(1,10),456+math.random(1,10),名字)  --输入用户名 
            mSleep(2000)
            随机账号密码()
            mSleep(1000)
            输入文本(272+math.random(1,10),515+math.random(1,10),密码)  --输入密码
            mSleep(1000)
            tap(361+math.random(1,10),620+math.random(1,10))
            mSleep(2000)
        elseif  当前界面 == "INS浏览器设置生日界面" or safari_day == "Add Your Birthday" then
	        --点击年月日开始选择生日
	        mSleep(500)
	        tap(210,694) --点击月
	        mSleep(5000)
            moveTo(385,1242+math.random(0,5) ,382,973+math.random(0,5)) --滑动月份
            mSleep(3000)
            tap(679,862)   --点击done
            mSleep(1000)
            
            tap(378,690) --点击日
            mSleep(3000)
            moveTo(383,1248+math.random(0,30) ,384,1096+math.random(0,30)) --滑动日期
            mSleep(3000)
            tap(679,862)    --点击done
            mSleep(1000)
            
            tap(530,688) --点击年
            mSleep(3000)
            for var=1,3 do
              moveTo(389,1255+math.random(0,5),411,1055+math.random(0,5)) --滑动年份
              mSleep(2000)
            end
            mSleep(3000)
            tap(679,862)    --点击done
            mSleep(1000)
            
            tap(364+math.random(0,10),949+math.random(0,10))
            mSleep(6000)
        
        elseif  当前界面 == "INS浏览器确认用户名界面" or  当前界面 == "INS浏览器确认用户名界面2" then
          tap(INS浏览器确认用户名NEXTX,INS浏览器确认用户名NEXTY)
          mSleep(1000)
        elseif  当前界面 == "浏览器确认用户名3" then
          tap(455,746)
          mSleep(1000)
        elseif  当前界面 == "浏览器确认用户名4" then
          tap(451,915)
          mSleep(1000)
        elseif  当前界面 == "浏览器确认用户名5" then
          tap(458,911)
          mSleep(1000)
        elseif  当前界面 == "浏览器确认用户名6" or 当前界面 == "浏览器确认用户名7" then
          tap(438,1004)
          mSleep(1000) 
        elseif  当前界面 == "浏览器确认用户名8" then
          tap(445,885)
          mSleep(1000)     
        elseif safari_usernameon == "Find people to follow and start" and isColor(479, 895, 0x0095f6, 90) then
          tap(435,910)
          mSleep(1000)
        elseif safari_register == 'Register' and safari_Welcome == 'Welcome' and safari_Change == 'Change username' and isColor(521, 907, 0x0095f6, 90) then
          tap(427,895)
          mSleep(1000)
        elseif  当前界面 == "浏览器长名字界面" then
          tap(426+math.random(0,10),584+math.random(0,10))
          mSleep(1000)  
        elseif  当前界面 == "INS浏览器授权facebook界面" then
          tap(INS浏览器授权facebookt跳过X,INS浏览器授权facebookt跳过Y)
          mSleep(1000)
        elseif  当前界面 == "google浏览注确认跳过facebook页面" then
          tap(确认跳过skipX,确认跳过skipY)
          mSleep(1000)          
        elseif 当前界面 == "火狐浏览器确认跳过facebook页面" then
          tap(火狐确认跳过skipX,火狐确认跳过skipY)
          mSleep(1000)   
        elseif  当前界面 == "INS浏览器添加头像界面" then
          tap(INS浏览器添加头像跳过X,INS浏览器添加头像跳过Y)
          mSleep(2000)
        elseif  当前界面 == "火狐浏览器确认跳过头像页面" then
          tap(火狐确认跳过skipX,火狐确认跳过skipX)
          mSleep(2000) 
        elseif  当前界面 == "火狐浏览器确认跳过头像页面2" then
          mSleep(1000)
          tap(369,908)
          mSleep(2000)
        elseif 当前界面 == "浏览器跳过手机验证" then
            mSleep(1000)
            tap(368,897)
            mSleep(2000)
		elseif 当前界面 =='浏览器允许保存cookie页面' then
		    mSleep(1000)
		    tap(374,1055,70,"click_point_5_2.png",1)     
		    mSleep(500)
		elseif 当前界面 =='浏览器允许保存cookie页面2' or 当前界面 =='浏览器允许保存cookie页面4'  then
		    mSleep(1000)
		    tap(383,1004,70,"click_point_5_2.png",1)    
		    mSleep(500)   
		elseif 当前界面 =='浏览器允许保存cookie页面3' then
		    mSleep(1000)
		    tap(409,878,70,"click_point_5_2.png",1)    
		    mSleep(500) 	
		elseif 当前界面 =='浏览器允许保存cookie页面5' then
		    mSleep(1000)
		    tap(374,1053,70,"click_point_5_2.png",1)    
		    mSleep(500) 		
		    
		    
		    
    ------google---------
		elseif 当前界面 == "google浏览器ins注册首页界面" then
            --tap(google浏览器ins注册按钮X,google浏览器ins注册按钮Y) 
            mSleep(2000)
            tap(416+math.random(5,10),891+math.random(5,10))
            mSleep(3000)
            判断是否离开该界面(INS注册界面列表,'google浏览器ins注册首页界面')            --需要配置的界面
        elseif 当前界面 == "浏览器ins登录界面2" then
            mSleep(1000)
            tap(517,868)
            mSleep(1000)
		elseif 当前界面 == "google浏览器ins注册手机号界面" then   --shipei
			mSleep(1000)
			tap(154,552)    --点击选择地区按钮
			mSleep(2000)
			if 当前界面 == "INS浏览器选择国家地区界面" then 
			 --   dialog("111")
    			 if values.号码地区 == '0' then
                    mSleep(500)
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"India")
                    tap(314,367)    --点击印尼
                    mSleep(500)
                elseif values.号码地区 == '1' then 
--                    tap(154,552)    --点击选择地区按钮
                    mSleep(500)
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Russia")
                    tap(175,357)    --点击俄罗斯
                    mSleep(500)
                elseif values.号码地区 == '2' then 
--                    tap(154,552)    --点击选择地区按钮
                    mSleep(500)
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"United")
                    tap(381,581)    --点击美国
                    mSleep(500)
               elseif values.号码地区 == '3' then 
 --                   tap(154,552)    --点击选择地区按钮
                    mSleep(500)
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Cambodia")
                    tap(219,363)  --点击柬埔寨
                    mSleep(500)
                else 
                    mSleep(500)
               end
            else
		         mSleep(1000)
		    end
			if values.接口序=='0' then
				电话号码=获取电话号码()
			elseif values.接口序=='1' then
				电话号码=获取手机号和ID2()
			elseif values.接口序=='2' then
				电话号码 = 获取电话号码3()
			elseif values.接口序=='3' then
				电话号码=获取手机号和ID4()
--			elseif values.接口序 == '4' then         --richpva   --待接入
--			    电话号码 = 获取手机号和ID5()         --预设平台的接入，暂时未出码，等待平台客服回复
			end
			输入文本2(google浏览器ins注册按钮X,google浏览器ins注册按钮Y,电话号码)   --inputText 版本
			mSleep(1000)
			tap(googlenext按钮X+math.random(1,10),googlenext按钮Y+math.random(1,10))	--next 按钮
			mSleep(5000)
			判断是否离开该界面(INS注册界面列表,'INS注册手机号界面')
        elseif 当前界面 == "google浏览器用户名不可用界面" then
            tap(点击GOBACK按钮X,点击GOBACK按钮Y)
            mSleep(3000)
            tap(367,500)
            mSleep(2000)
        elseif 当前界面 == "google浏览器重新设置用户名界面" or 当前界面 == "浏览器重新设置用户名界面"  then
            mSleep(3000)
            -- tap(625,477)
            -- mSleep(2000)
            -- tap(414,619) --点击 Next
            toast("账号不可用")
            全局变量1=3    --出错页面重新开始
            mSleep(1000)
        elseif 当前界面 == "浏览器验证码失败页面"  or 当前界面 == "INS浏览器报错界面" or 当前界面 == "INS浏览器网络报错界面" then     
            mSleep(3000)
            全局变量1=3    --出错页面重新开始
            --mSleep(3000)
        elseif 当前界面 == "google浏览注册error页面" or 当前界面 == "浏览器注册出错2"  or 当前界面 == "浏览器网络出错2"  then 
            mSleep(3000)
            全局变量1=3    --出错页面重新开始
        elseif 当前界面 == "浏览器用户被封禁" or 当前界面 == "浏览器用户被封禁2" then     
            mSleep(2000)
            toast("账号被封禁")
            全局变量1=3     --出错页面重新开始
            mSleep(1000)
        elseif 当前界面 == "浏览器人机检测页面2"  or 当前界面 == "浏览器人机检测页面"  then
            toast("人机检测，重新开始")
            mSleep(3000)
            全局变量1=3    --出错页面重新开始
            mSleep(3000)
        elseif 当前界面 == "浏览器网络连接错误界面" then
            if values.手动获取代理 == 'on' then
                for var= 1,15 do
                    mSleep(5000) 
                    toast("等待刷新中...")
                end
                全局变量1=3
            else
                mSleep(2000)
                 全局变量1=3
            end
            mSleep(1000)    
        elseif 当前界面 == "浏览器手机号失败界面" or 当前界面 == "手机号出错界面"  then
            全局变量1=2  --释放号码 并重启脚本
            mSleep(1000)
        -- elseif 当前界面 == "INS浏览器报错界面" or 当前界面 == "INS浏览器网络报错界面"  then
        --     for var=1,6 do
        --         mSleep(2000)
        --     end
        --     全局变量1=3
        elseif 当前界面=='未知界面' then
             mSleep(2000)
        elseif  当前界面 == "INS浏览器个人主页界面" or 当前界面 == "火狐浏览器INS个人主页界面"  or 当前界面 == "INS界面个人主页2" or  当前界面 == "INS浏览器个人主页界面004" then
           --注册完成
           tap(674,1206)
           mSleep(2000)
           全局变量1=1   --注册成功
           break
        else

        end
        
        if safari_story == "Your Story"  then
           --注册完成
           tap(674,1206)
           mSleep(2000)
           全局变量1=1   --注册成功
           break   
        else
         
        end
       
        local erol =  ocrText(247,600,515,630,0)
        if erol == "Couldn't Create" then
          全局变量1=3
          mSleep(1000)
        end
        -- local ero2 =  ocrText(154,338,669,375,0)
        -- if ero2 == "Suspended Your Account" then
        -- toast("账号被封禁")
        -- 全局变量1=3
        -- mSleep(1000)
        -- end
        local ero3 =  ocrText(90,530,530,553,0)
        if ero3 == "This email is taken bv another account" then
        toast("邮箱被使用")
        全局变量1=3
        mSleep(1000)
        end
        -- if 当前界面 == "google浏览注册error页面"  then
        --     mSleep(3000)
        --     记录账号信息()
        --     --移动cookies()
        --     --全局变量1=3
        --     mSleep(3000)
        -- else
                
        -- end
    end
end




function 设置资料()
while (true) do   --修改资料界面，未编写
	local 当前界面=检索界面(INS界面列表) 
	if 当前界面 == '' then


	end
	mSleep(1000)
end
end


function 设置头像()
while (true) do
	local 当前界面=检索界面(INS界面列表)
	if 当前界面=='INS界面个人主页' then  
--		tap(122+math.random(10.20), 230+math.random(10.20))  --点击头像
--		mSleep(500)
--		tap(324+math.random(10.20), 1010+math.random(10.20))  --点击add profile photo
--		mSleep(500)
--		tap(369+math.random(10.20), 1122+math.random(10.20))  --点击choose from library
--		mSleep(500)	
		tap(336+math.random(1,10),  437+math.random(1,10)) --点击设置资料
		mSleep(1000)
	elseif 当前界面=='INS界面设置资料' then  
		tap(374+math.random(10.20),  273+math.random(10.20))  --点击头像
		mSleep(500)
		tap(369+math.random(10.20), 1122+math.random(10.20))  --点击choose from library
		mSleep(500)
			if 当前界面 == "INS界面弹框1" then
				tap(513+math.random(10.20),  834+math.random(10.20))
				mSleep(500)
			end
		--滑动到所有相片
		moveTo( 656, 1118, 660,  532,{["step"] = 20,["ms"] = 70,["index"] = 1,["stop"] = 1}) 
		mSleep(1500)
		--随机选择相片
		moveTo(370+math.random(1,10),988+math.random(1,10),374+math.random(1,10),461+math.random(1,10))
		mSleep(2000)
		tap(math.random(64,649),math.random(410,1191))  --选择相片
		mSleep(3000)
		tap(688+math.random(10,15), 42+math.random(10,15))   --点击 done
		

	elseif 当前界面=='INS浏览器个人主页界面' then         --浏览器设置头像
	    tap(INS浏览器点击主页X,INS浏览器点击主页Y)
	    mSleep(1000)
    elseif 当前界面=='INS浏览器我的界面' then  
        mSleep(1000)
	    tap(INS浏览器设置资料X,INS浏览器设置资料Y)
	    mSleep(1000)
	    tap(304,336)    --点击修改头像
	    mSleep(2000)
	    tap(208,1048)    --点击选择相册
    elseif 当前界面=='火狐浏览器INS我的界面' then  
        mSleep(1000)
	    tap(火狐浏览器INS设置资料X,火狐浏览器INS设置资料Y)
	    mSleep(1000)
	    tap(212,346)    --点击修改头像
	    mSleep(2000)
	    tap(220,1053)    --点击选择相册	    
	elseif 当前界面=='INS浏览器选择相册界面' then  
	    tap(INS浏览器设置资料X,INS浏览器设置资料Y)
	    mSleep(1000)
	elseif 当前界面=='INS浏览器选择照片界面' then  
		moveTo(370+math.random(1,10),988+math.random(1,10),374+math.random(1,10),461+math.random(1,10))  --滑动照片
		mSleep(2000)
		tap(math.random(64,649),math.random(410,1191))  --随机点击照片
		mSleep(3000)
		tap(673+math.random(1,10),84+math.random(1,10))  --点击 Done
		mSleep(1000)
		tap(679+math.random(1,10),184+math.random(1,10))  --点击save 
		mSleep(1000)
	elseif 当前界面=='INS浏览器发布头像动态界面' then  	
        tap(INS浏览器CancelX,INS浏览器CancelY)  --点击不发布作品
        mSleep(1000)
	else
	
	end
end
end


function INS账号登录()
	while (true) do
	    mSleep(3000)
	    local Error = ocrText(27,473,260,494,0)   --识别 Incorrect nassword. 文字
	    local Error5 = ocrText(220,547,532,590,0)   --识别Incorrect password文字
	    local 通知 = ocrText(168,780,318,816,0)   --识别Not now文字
	    local 验证 = ocrText(184,194,578,254,0)   --识别 Confirm It's You文字
	    local Error2 = ocrText(318,514,425,557,0)   --识别 Error  文字
	    local 网络错误 = ocrText(198,606,556,645,0)   --识别Please check your internet文字
	    local Error3 = ocrText(330,551,425,587,0)   --识别Error文字
	    local login = ocrText(330,563,426,597,0)    --识别Log in文字
	    local 封禁 = ocrText(54,222,697,285,0)   --识别We suspended your account文字
	    local 禁用 = ocrText(143,550,563,582,0)   --识别Your account has been disabled文字
	    local Error4 = ocrText(328,485,424,522,0) --识别Error文字
	    local 用户名错误 = ocrText(155,664,422,690,0)   --识别check your username文字
	    local 用户名错误2 = ocrText(212,517,535,552,0)   --识别Incorrect Username文字
		local 当前界面=检索界面(INS登录界面列表)
        if 当前界面 == 'INS注册开屏界面' or 当前界面 == 'APP注册登录开屏界面2' or 当前界面 == 'APP注册登录界面3' or 当前界面=='APP登录注册界面' then 
            tap(373,840)
            mSleep(1000)
        elseif 当前界面 == 'INS注册登录界面' or 当前界面 == 'APP登录输入账密界面' then
            mSleep(1500)
            读取首行()
            if INS账号 == "" or INS密码=="" then 
                toast("当前账密格式有误")
                删除首行()
            end            
            mSleep(2000)
            tap(187,481)
            mSleep(1000)
            if (isColor(658, 278, 0xc7c8c7, 90)) then --如果发现有 × 则点击
                mSleep(1000)
                tap(648,279)
                输入文本2(313,266,INS账号)
                mSleep(1000)
            else
                输入文本2(313,266,INS账号)
                mSleep(1000)
            end

            输入文本(129,393,INS密码)   
            mSleep(1000)
            tap(581,573)   --点击login
            mSleep(6000)
        elseif login == "Log in" and isColor(496, 583, 0x4997fd, 90) then
            mSleep(1000)
            tap(581,573)   --点击login
        elseif 当前界面 == ' APP登录账号验证界面' or  验证 == "Confirm It's You" then 
            全局变量1=5
            mSleep(2000)
            删除首行()
            mSleep(2000)
        elseif Error3 == "Error" and 网络错误 == 'Please check your internet' then
            全局变量1=4
            -- 删除首行()
            mSleep(5000)       
        elseif Error4 == 'Error' and 禁用 == 'Your account has been disabled' then
            全局变量1=6
            mSleep(2000)
            删除首行()
            mSleep(2000)        
        elseif 当前界面 == 'APP用户被封禁' or 当前界面 == 'APP错误界面3' or 封禁 == 'We suspended your account'  then
            mSleep(1000)
            全局变量1=6
            mSleep(2000)
            删除首行()
            mSleep(2000)
        elseif  用户名错误 == 'check your username' or 用户名错误2 == 'Incorrect Username' or 当前界面 == 'APP用户名错误界面' then
            mSleep(1000)
            toast("账密错误!，正在记录账号信息")
            记录账号信息()
            全局变量1=6
            mSleep(2000)
            删除首行()
            mSleep(2000)
        end
        if Error == "Incorrect nassword." or Error5 == "Incorrect password" then 
            全局变量1=6
            mSleep(2000)
            删除首行()
            mSleep(2000)
        end
        if Error2 == "Error" then
            全局变量1=6
            mSleep(2000)
            删除首行()   
        end
        
        if 通知 == "Not now" then 
            mSleep(1000)
            tap(227,805)
            mSleep(1000)
            删除首行()
    	    if values.使用软件 == "2" then
    	        for var=1,3 do
    	            mSleep(5000)
    	            toast("正在上传账号")
    	        end
    	    end
            全局变量1=7   --登录成功  
            return true
        elseif 当前界面 == 'APP登录个人主页' or 当前界面 == 'APP登录个人主页界面2' or 当前界面 == 'APP登录个人主页03' or 当前界面 == 'APP登录个人主页04'  then 
            mSleep(1000)
            删除首行()
-------------------------------替换钥匙扣步骤开始---------------------------------------            
            -- if values.使用软件 == '0' then
            --     移动token文件()
            -- else
            --     mSleep(500)
            -- end
-------------------------------替换钥匙扣步骤结束---------------------------------------        
    	    if values.使用软件 == "2" then
    	        for var=1,3 do
    	            mSleep(5000)
    	            toast("正在上传账号")
    	        end
    	    end
            全局变量1=7   --登录成功
            return true
        end
    end
end









