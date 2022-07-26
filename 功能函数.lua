Firefox = 'org.mozilla.ios.Firefox'

function 打码准备()
    for var= 1, 30 do
        xx,yy = findMultiColorInRegionFuzzy(0xf4f5f6, "-10|254|0xf4f5f6,246|278|0xf4f5f6,237|110|0xf4f5f6,240|-7|0xf4f5f6,452|7|0xf4f5f6,451|234|0xf4f5f6,182|172|0xcacaca",90,123,479,594,770)
        if xx>0 then
            mSleep(1000)
        else
            toast(xx..','..yy,1)
            return true
        end
        xx1,yy1 = findMultiColorInRegionFuzzy(0xcacaca, "367|4|0xcdcdcd,184|-80|0xcacaca,133|29|0xcacaca,238|39|0xcacaca,232|34|0xcacaca,-68|278|0x505050,-32|284|0x505050",90,118,555,559,925)
        if xx1>0 then   --说明验证码没有刷新
            tap(117,925) 
            mSleep(3000)
        end
    end
end

function 图鉴打码()
    function userPath()
        return "/var/mobile/Media/TouchSprite"	--填写触动实际路径
    end

    function ttScreen(x1,y1,x2,y2,scale)  -- 此处为触动截图方法
        scale=scale or 1
        local path=userPath().."/res/ttshu.png"
        snapshot("ttshu.png",x1,y1,x2,y2,scale)
        return path
    end
    local a = ttScreen(99,459,650,802,1) --图片的路径完整路径此处为截图获取的路径
    --	dialog(tostring(a))
    res,id = tt.Image(a,33) --开始识别  33为滑块验证类型  返回起始X坐标
    --	dialog("result:"..tostring(res)..tostring(id)) --识别结果,识别id
    --识别结果报错示例。
    --	res1=tt.ReportError2(id) 
    --	dialog(tostring(res1))
    if res ~= nil then 
        local  终止坐标X=107+tonumber(res)
        moveTo(107,847,终止坐标X,847,{["step"] = 20,["ms"] = 100,["index"] = 1,["stop"] = true})
    else
        toast('获取打码坐标失败',1)
        return false
    end
    for var=1,20 do
        mSleep(200)
        if isColor(135,853,0xffc1c1) then   --判断打码是否成功
            --打码失败
            bool = tt.ReportError2(id) 
            toast('打码失败',1) 
            break
        end
    end
end

function 向上翻页()
    local 随机数=math.random(0,5)
    touchDown(312+math.random(0,5),1294+math.random(0,5));    
    mSleep(30);
    --移动到坐标
    for i = 0,980,40 do    
        touchMove(312+math.random(0,5),1289-i); 
        --延迟
        mSleep(10);        
    end
    for ii= 1,5 do
        touchMove(312,309+随机数-ii); 
        --延迟
        mSleep(50);   
    end
    --在坐标  抬起
    mSleep(100)
    touchUp(312+随机数,304+随机数);
    mSleep(100)
end

function 向上翻页2()
    local 随机数=math.random(0,5)
    touchDown(312+math.random(0,5),990+math.random(0,5));    
    mSleep(30);
    --移动到坐标
    for i = 0,725,40 do    
        touchMove(312+math.random(0,5),990-i); 
        --延迟
        mSleep(10);        
    end
    for ii= 1,5 do
        touchMove(312,265+随机数-ii); 
        --延迟
        mSleep(50);   
    end
    --在坐标  抬起
    mSleep(100)
    touchUp(312+随机数,260+随机数);
    mSleep(100)
end

function 卸载应用(包名)
	flag = ipaUninstall(包名)
	--dialog(tostring(flag))
	if flag == 1 then
		toast("卸载成功")
	else
		toast("卸载失败")
	end
end

function 安装Firefox()
	flag = ipaInstall(userPath().."/res/Firefox.ipa")       --ipa文件需要放进指定路径下面
	if flag == 1 then
    	toast("安装成功")
    	return true
    else
    	toast("安装失败,请检查文件是否存在")
    end
end


-- function 打码()
--     text,tid = ocrScreen(207,519,646,747,1318,60,0.5)
--     if text~=nil then --成功获取数据
--         --------返回的坐标X+144，起始坐标Y
--         new = text:split(",") -- 将字符串 str 按照 `,`
--         local 终止坐标X=起始坐标X+new[1]+打码X偏移量
--         moveTo(起始坐标X,起始坐标Y,终止坐标X,起始坐标Y,{["step"] = 20,["ms"] = 100,["index"] = 1,["stop"] = true})
--     else
--         toast('获取打码坐标失败',1)
--         return false
--     end
--     for var=1,20 do
--         mSleep(200)
--         if isColor(135,853,0xffc1c1) then  --判断打码是否成功
--             --打码失败
--             bool = ocrReportError()
--             toast('打码失败',1) 
--             break
--         end
--     end
-- end



function 随机账号密码()
    local 域名集={'gmail.com','yahoo.com','outlook.com','hotmail.com','icloud.com'}
    local ret=获取随机字符(5,9)
    账号=ret..'@'..域名集[math.random(1,5)]    -------这个是随机出来的邮箱账号
    local ret1=获取随机字符(5,8)
    --密码=ret1..'a1.' --随机密码

    --密码= 'qqq111...'
    密码 = values.指定密码    --指定密码，如果没有指定密码，那么随机一个密码
    if 密码 == '' then
        密码=ret1..'a1.'
    else
        mSleep(1000)
        密码 = values.指定密码
    end
end

function 随机用户名1()
    local str1 ="abcdefghijklmnopqrstuvwxyz0123456789"
    local options = {
        ["tstab"] = 1,
        ["num"] = math.random(6,8),
    }
    local ret=getRndStr(str1,options)
    --dialog(ret)
    return ret
end

function get_seeda() 
    local t = string.format("%f", socket.gettime())
    local st = string.sub(t, string.find(t, "%.") + 1, -1) 
    return tonumber(string.reverse(st))
end 

function 随机用户名(n) 
    math.randomseed(get_seeda()) 
    local t = {
        "0","1","2","3","4","5","6","7","8","9",
        "a","b","c","d","e","f","g","h","i","j","k","l","m","n","o","p","q","r","s","t","u","v","w","x","y","z",
        "A","B","C","D","E","F","G","H","I","J","K","L","M","N","O","P","Q","R","S","T","U","V","W","X","Y","Z",
    }    
    -- local t2 = {"_"}
    local s = ""
    for i =1, n do
        -- s = s .. t[math.random(#t)]        
        s = s .. t[math.random(1,62)]
    end
    return s
end


function 随机用户昵称()
    local str1 ="abcdefghijklmnopqrstuvwxyz"
    local options = {
        ["tstab"] = 1, 
        ["num"] = math.random(1,3),
    }
    local ret=getRndStr(str1,options)
    随机昵称 = tostring(获取随机文本(values.文件名称))
    return 随机昵称..ret
end

function 打开VPN()
    flag = getVPNStatus()
    if flag.active then
        toast('vpn已开启',1)
    else
        setVPNEnable(true)
        toast('vpn已开启',1)
        mSleep(3000)
    end
end

function 关闭VPN()
    flag = getVPNStatus()
    if flag.active then
        toast('检测到vpn已开启，关闭VPN',1)
        setVPNEnable(false)
    else
        mSleep(3000)
    end
end

function INS防闪退启动()
    local 当前界面
    打开应用(INS,5000)
    while (true) do
        当前界面=检索界面(INS注册界面列表)
        if 当前界面~='未知界面' then
            return true
        else
            bid = frontAppBid();
            if bid ~= 'com.burbn.instagram' then 
                打开应用(INS,5000)
            end
            mSleep(2000)
        end
    end
end


------------------手动S5设置------------------------------------------------------------------------------------------------------------
function 获取S5代理()
    获取S5接口 = values.代理链接
    -- 获取S5接口 = "http://20.122.103.3:51515/api/v1/getIP?type=text&username=test_99641&protocol=0&region=RU&count=1"  --测试链接
    -- 获取S5接口 = "https://coralip.com/api/v2/getIP?username=pps_erkang&password=pzhuondvwb&protocol=0&count=1&region=&keep_time=2&type=text"     --珊瑚IP
    
    -- 返回格式1：socks5://test_99641$ifhie8NkW4*US:owrjgdnhg@185.145.128.72:4113
    -- 返回格式2：http://139.155.87.202:1688/api/v2/USIP/usip.php                            返回值 3.101.85.252:20089
    -- 返回格式3：http://129.226.173.62:8888/getport     ip端固定129.226.173.62   端口返回值 {"code":0,"message":"","data":43897}    需要拼接为 IP+端口 填入ssr
    local webdata=httpGet(获取S5接口)
    --dialog(tostring(webdata))
    if tostring(webdata) =='false' then
        for var=1 , 5 do
            mSleep(5000)
            toast("正在获取代理...")
        end
        toast("获取代理失败")
        全局变量1 = 4
    else
        
    end    
    
    if  values.手动获取代理 == "0" then 
        ------------------    --黄--格式1需要打开   ----------------------------------
        local strs1 = webdata:split("//")  --分割前缀
        local strs2 = strs1[2]:split("@")  --分割账号密码 + IP端口
        local strs3 = strs2[1]:split(":")  --分割账号  密码
        local strs4 = strs2[2]:split(":")  --分割IP 端口
        代理账号 = strs3[1]
        代理密码 = strs3[2]
        代理端口 = strs4[2]
        代理IP = strs4[1]
        ------------------------------------------------------------------------------
    elseif values.手动获取代理 == "1" then 
        -- toast("text")
        local strs6 = webdata:split(":")  --分割IP 端口  --北鲲云
        代理端口 = tonumber(strs6[2])
        代理IP = strs6[1]
    elseif values.手动获取代理 == "2" then                                                 
        local strs5 = json.decode(webdata)
        local ss = ((values.代理链接:split("//")[2]):split("/")[1]):split(":")[1]
        -- 代理IP = "129.226.173.62"       --自测           http://129.226.173.62:8888/getport?region=US
        -- 代理IP = "119.28.87.24"         --大有数据       http://119.28.87.24:8888/getport?region=US
        代理IP = ss
        代理端口 = strs5.data
    else
        
    end
    --dialog("账号密码："..strs2[1].."IP端口"..strs2[2])
    --dialog("账号:"..strs3[1].."密码："..strs3[2])
    --dialog("IP:"..strs4[1].."端口:"..strs4[2])   
    --dialog("IP："..代理IP.."端口："..代理端口)
end

function 手动设置代理()
    关闭应用("com.liguangming.Shadowrocket")
    mSleep(500)
    打开应用("com.liguangming.Shadowrocket",500)
    mSleep(3000)
    tap(695,82,80,"click_point_5_2.png",1)  --点击加号
    mSleep(1000)
    tap(485,208,80,"click_point_5_2.png",1)  --点击类型
    mSleep(1000)
    tap(362,773,80,"click_point_5_2.png",1)  --点击Socks5
    mSleep(1000)
    -- 开始输入
    -- tap(226,360) --点击地址
    -- dialog(代理IP)
    -- 获取S5代理()
    输入文本2(226,360,代理IP)
    mSleep(500)

    tap(220,455)
    mSleep(1000)
    小键盘输入(代理端口)
    mSleep(500)
    -- dialog(代理账号)
    if  values.手动获取代理 == 0 then 
        输入文本2(304,542,代理账号)    --黄--格式需要打开
        mSleep(500)
        -- dialog(代理密码)
        输入文本2(221,623,代理密码)    --黄--格式需要打开
        mSleep(500)
    end
    tap( 680,83) -- 点击完成
end

function 检查代理连通状态()
    for var= 1,15 do
        local webdata = httpGet("http://www.google.com/")               --获取谷歌网页数据
        toast(tostring(webdata).."，网络无法连接，正在重试...")
        mSleep(3000)
        if  webdata and webdata ~= "" then
            toast("网络正常，开始运行")
            break
        else
            --dialog("网络连通异常")
            全局变量1=4
        end
    end
    mSleep(3000)
end

function 删除手动设置的代理()
    mSleep(2000)
    if (isColor( 682,  551, 0xc4c4c6, 85)) then  --如果找到色块，则返回 true
        toast("无代理节点")
        mSleep(1000)
        return true
    else
        关闭应用("com.liguangming.Shadowrocket")
        mSleep(1000)
        打开应用("com.liguangming.Shadowrocket",1000)
        mSleep(3000)
        moveTo(552,  553,486,  548,{["step"] = 30,["ms"] = 70,["index"] = 1,["stop"] = 1})  --滑动显示删除
        mSleep(1000)
        tap(641,  555)  --滑动之后点击删除
        mSleep(1000)
        tap( 510,  763) --确认删除
        mSleep(2000)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------



---------------------------------------------本地上传手机号版本---------------------------------------------------------
function 获取电话号码()
    --http://20.122.103.3:11223/api/v2/phone/getPhone?token=erkang
    local webdata,tmp,获取状态
    for var= 1,20 do
        --dialog("获取到的电话号码接口："..values.电话号接口)   
        webdata = httpGet(values.电话号接口,60)  --获取token数据
        tmp = json.decode(webdata)
        --dialog("获取到的json："..webdata)   
        获取状态= tostring(tmp.code)
        电话号码=tmp.data.phone
        获取验证码地址=tmp.data.smsCodeLink
        无可用手机号 = tmp.msg
        --dialog("获取状态:"..获取状态)
        --dialog("获取到的验证码地址："..获取验证码地址) 
        --dialog("电话号码:"..电话号码)
        if 获取状态 == '0' then
            mSleep(1000)
            return 电话号码
        elseif 无可用手机号 == '没有可用号码' then
            toast('没有号码')
            --dialog('没有号码')
            lua_exit()
        else
            toast("无法获取到号码，请检查网络或者是否还有更多号码")
            mSleep(1000)
        end
        mSleep(5000)
    end
    dialog('获取电话号失败')
    lua_exit()
end

function 获取验证码()
    local webdata,tmp,验证码
    for var= 1,14 do	
        webdata = httpGet(获取验证码地址,10)
        --判断json格式和文本格式  如果前一个字符是 {  那就是json  否则就是文本
        local isjson = string.sub(webdata,1,1)
        --dialog(isjson,2)
        if isjson == "{" then
            toast("验证码格式为json格式",2)
            --dialog("webdata:"..webdata)
            local tmp = json.decode(webdata)	
            验证状态 = tostring(tmp.flag)
            --信息内容 = tostring(tmp.message)
            --dialog("验证状态："..验证状态,2)
            --dialog("信息内容："..信息内容,2)
            for var= 1, 14 do
                if 验证状态 == 'false'  then
                    mSleep(5000)
                    if (isColor(  69,  475, 0xfe2c55, 85)) then
                        tap(  113+math.random(0,5),  478+math.random(0,5)) --点击重新发送
                    end
                else
                    break
                end
            end
            local res_f = tostring(tmp.message)
            local res ,_ = res_f:gsub("%D+","")  		--正则验证码
		
            --dialog("message:"..res_f,2)
		
            if 验证状态 =='true' then		
                验证码 = string.sub(res,1,6) 			--6位数验证码 
                --dialog("验证码:"..验证码,2)
                return 验证码
            else
            end			
        else
            toast("验证码格式为文本格式",2)
            -- webdata1 = [[[TikTok] 3875 is your verification code, valid for 5 minutes. To keep your account safe, never forward this code.]]
            --dialog("webdata:"..webdata,2)
            str = string.sub(webdata,33,34)
            for var= 1,14 do	
                if str == 'on' then
                    break
                else
                    mSleep(5000)
                end
            end 
            if str == 'on' then		
                验证码 = string.sub(webdata,10,13) 			--4位数验证码 
                --dialog("验证码:"..验证码,2)
                return 验证码
            else
                mSleep(5000)
            end
        end
    end
    toast('获取验证码失败',1)
    全局变量1=2
    mSleep(5000)
end

function 释放电话号码()
	if  values.接口序=='0' then	
		if 电话号码~='' then
			toast('释放电话号码',1)
			local str = values.电话号接口:split("token=")
			local token值 = str[2]
			--dialog("token值:"..token值)
			--dialog("电话号码："..电话号码)		
	--		local webdata=httpGet(str[1]..'/v2/api/setting/phone/status?name='..str2[2]..'&phone='..电话号码..'&token='..token值)
			local webdata1=httpGet('http://20.122.103.3:11223/api/v2/phone/reset?token='..token值..'&phone='..电话号码)
			token值 = ''
			电话号码 = ''
		else
			toast('号码没有啦！')
			--lua_exit()
			--全局变量1=2
			mSleep(5000)
		end	
	elseif values.接口序== '1' then
		toast('释放电话号码',1)
		发送状态('8')
	else
		toast('释放5sim电话号码',1)
		发送状态4('8')
	end
end----------------------------------------------------------------------------------------------------------------------------------


function 小键盘输入(数字验证码)
    local 验证码长度=string.len(数字验证码)
    for i= 1,(验证码长度) do
        local 数字=tonumber(string.sub(数字验证码,i,i)) --把字符串转化为整数
        tap(键盘坐标[数字+1][1],键盘坐标[数字+1][2])
        mSleep(1000)
    end
end

--------------------------------------SMS--------------------------------------------------------
function 获取KEY值()
    local wet= values.电话号接口2:split("key=")
    local wet1=wet[2]:split("&action")
    api_key值=wet1[1]
    --dialog("获取KEY值:"..api_key值)
end

function 获取国家代码()
    local new= values.电话号接口2:split("country=")
    --dialog("国家代码："..new[2])
    if new[2]=='36' then--加拿大
        return '1'
    elseif new[2]=='22' then--印度
        return '91'
    elseif new[2]=='6' then--印度
        return '62'        
    elseif new[2]=='0' then--俄罗斯
        return '7'
    elseif new[2]=='12' then--美国虚拟
        return '1'
    elseif new[2]=='73' then--巴西
        return '55'
    elseif new[2]=='16' then--英格兰
        return '44'
    elseif new[2]=='21' then--埃及
        return '20'
    elseif new[2]=='70' then--委内瑞拉
        return '58'
    elseif new[2]=='32' then--罗马尼亚
        return '40'
    elseif new[2]=='62' then--土耳其
        return '90'
    elseif new[2]=='56' then--西班牙
        return '34'
    elseif new[2]=='78' then--法国
        return '33'
    elseif new[2]=='76' then--安哥拉
        return '244'
    elseif new[2]=='10' then--越南
        return '84'
    elseif new[2]=='66' then--巴基斯坦
        return '92'
    elseif new[2]=='43' then--德国
        return '49'
    elseif new[2]=='187' then--美国物理
        return '1'
    elseif new[2]=='40' then--乌兹别克斯坦
        return '998'
    elseif new[2]=='11' then--吉尔吉斯坦
        return '996'
    elseif new[2]=='88' then--洪都拉斯
        return '504 '
    elseif new[2]=='24' then--柬埔寨
        return '855'
    elseif new[2]=='161' then--土库曼斯坦
        return '993'
    elseif new[2]=='1' then--乌克兰
        return '380'
    elseif new[2]=='90' then--尼加拉瓜
        return '505'
    elseif new[2]=='7' then--马来西亚
        return '60'
    elseif new[2]=='4' then--菲律宾
        return '63'
    elseif new[2]=='103' then--牙买加
        return '876'
    elseif new[2]=='46' then--瑞典
        return '46'
    elseif new[2]=='48' then--荷兰
        return '31'
    elseif new[2]=='5' then--缅甸
        return '95'
    elseif new[2]=='34' then--爱沙尼亚
        return '372'
    elseif new[2]=='15' then--波兰
        return '48'
    elseif new[2]=='72' then--蒙古
        return '976'
    else
        dialog('未知国家代码')
        lua_exit()
    end
end

function 获取手机号和ID2()
    获取KEY值()
    国家代码=获取国家代码()
    --dialog("获取国家代码:"..国家代码)
    --mSleep(1000)
    local wet= httpGet(values.电话号接口2,20)
    new = tostring(wet):split(":")
    --dialog("获取到的号码状态："..wet)
    while (true) do
        if new[1]=='ACCESS_NUMBER' then 
            激活ID=new[2]
            电话号码=string.gsub(new[3],国家代码,"",1):atrim()
            --dialog("电话号码:"..电话号码)
            mSleep(1000)
            发送状态('1')
            return 电话号码
        elseif new[1]=='NO_NUMBERS' then
            dialog('没有号码')
            lua_exit()
        elseif new[1]=='NO_BALANCE' then
            dialog('余额不足')
            lua_exit()
        else
            toast('获取手机号失败,请检查密钥和项目ID',3)
            mSleep(2000)
            全局变量1=4
           -- mSleep(3000)
        end
    end
end

function 发送状态(状态)--string ,   1-通知已发送短信   6.激活成功   8.激活失败
    --wet= httpGet('https://sms-activate.ru/stubs/handler_api.php?api_key='..api_key值..'&action=setStatus&status='..状态..'&id='..激活ID)     --原地址
    wet= httpGet('https://api.sms-activate.org/stubs/handler_api.php?api_key='..api_key值..'&action=setStatus&status='..状态..'&id='..激活ID)
end

function 获取验证码2()
    local webdata,tmp,验证码
    for var= 1,14 do 
        webdata = httpGet('https://api.sms-activate.org/stubs/handler_api.php?api_key='..api_key值..'&action=getFullSms&id='..激活ID,5)
        --webdata = httpGet('https://sms-activate.ru/stubs/handler_api.php?api_key='..api_key值..'&action=getFullSms&id='..激活ID,5)			--原地址
        --	if webdata=='STATUS_WAIT_CODE' or webdata== false then
        if webdata == 'STATUS_WAIT_CODE' or webdata == "STATUS_WAIT_RETRY" or webdata == false then	
            toast("正在获取验证码中...")
            mSleep(5000)
        else
          -- toast("获取验证码失败")
            break
        end
    end
--Use 819 023 to verify your Instagram account.
    tmp=webdata:split(':')

    local res,_ = webdata:gsub("%D+","")    	-- 使用正则匹配验证码  目前测试 适配16.6.5版本4位数验证码
    
    if tmp[1]=='FULL_SMS' then
        mSleep(1000)
        发送状态('6')
        验证码 = string.sub(res,1,6)  	--6位数验证码 
        mSleep(1000)
        return 验证码
    else
        toast('获取验证码失败',1)
        全局变量1=2
        mSleep(5000)
    end
end
---------------------------------------------------------------------------------------------------------------------------------------------


------------------------------------适配内部对接接码格式-------------------------------------------------------------------------------------
function 获取电话号码3()
    local webdata,tmp,获取状态
    --http://20.122.103.3:11223/api/v1/sms/getPhone?token=b0633c54509bb534feef5968625acbea&itemId=1
    for var= 1,20 do
        webdata = httpGet(values.电话号接口3)  --获取jsonn数据
        --dialog(tostring(webdata))
        tmp = json.decode(webdata)
        --dialog("获取到的json："..webdata)   --调试打印，上线需要注释
        获取状态=tostring(tmp.code)
        --dialog("获取状态"..获取状态)
        电话号码带区号=tmp.msg
        --dialog("获取到的电话地址："..电话号码带区号)   --调试打印，上线需要注释
        if 获取状态 == '0' then
            mSleep(1000)
            local 电话号码 = string.sub(电话号码带区号,3,13) 
            --dialog("电话号码:"..电话号码)
            return 电话号码
        elseif 电话号码带区号 == '无可用号码' then
            dialog('没有号码')
            lua_exit()
        else
            toast("无法获取到号码，请检查网络或者是否还有更多号码")
            mSleep(1000)
        end
        mSleep(5000)
    end
    dialog('获取电话号失败')
    lua_exit()
end

function 获取验证码3()
    local webdata,tmp,验证码
    for var= 1,20 do	
        local 获取验证码地址 = "http://20.122.103.3:11223/api/v1/sms/getSmsCode?token=b0633c54509bb534feef5968625acbea&itemId=1&phone="..电话号码带区号
        --dialog(获取验证码地址)    --调试打印，上线需要注释
        webdata = httpGet(获取验证码地址,10)
        tmp = json.decode(webdata)	--需要兼容的位置！！！！！！！！
        --dialog(webdata)    --调试打印，上线需要注释	
        获取状态 = tostring(tmp.code)
        --dialog("获取状态"..获取状态)
        if 获取状态 == '-1' then
            mSleep(5000)
            if (isColor(  69,  475, 0xfe2c55, 85)) then
                tap(  113+math.random(0,5),  478+math.random(0,5)) --点击重新发送
            else
            end
        else
            break
        end
    end
    local res_s = tostring(tmp.msg)
    local res, _ = res_s:gsub("%D+","")  		--正则验证码
    --dialog("res:"..res)
    if 获取状态 == '0'  then
        验证码 = string.sub(res,1,6)		--6位数验证码 
        mSleep(1000)
        return 验证码
    else
        toast('获取验证码失败',1)
        全局变量1=2
        mSleep(5000)
    end
end

--不做释放操作

--------------------------------------------------------------------------------------------------------------------------------------------------------

------------------------------------------------------   51Sim     ------------------------------------------------------------------------------------
function 获取5simKEY值()
local wet= values.电话号接口4:split("key=")
local wet1=wet[2]:split("&action")
sim_api_key值=wet1[1]
--dialog("获取到的sim_api_key值:"..sim_api_key值)
end

function 获取国家代码4()
local new= values.电话号接口4:split("country=")
--dialog("国家代码："..new[2])
if new[2]=='36' then--加拿大
	return '1'
elseif new[2]=='22' then--印度
	return '91'
elseif new[2]=='0' then--俄罗斯
	return '7'
elseif new[2]=='12' then--美国虚拟
	return '1'
elseif new[2]=='73' then--巴西
	return '55'
elseif new[2]=='16' then--英格兰
	return '44'
elseif new[2]=='21' then--埃及
	return '20'
elseif new[2]=='70' then--委内瑞拉
	return '58'
elseif new[2]=='32' then--罗马尼亚
	return '40'
elseif new[2]=='62' then--土耳其
	return '90'
elseif new[2]=='56' then--西班牙
	return '34'
elseif new[2]=='78' then--法国
	return '33'
elseif new[2]=='76' then--安哥拉
	return '244'
elseif new[2]=='10' then--越南
	return '84'
elseif new[2]=='66' then--巴基斯坦
	return '92'
elseif new[2]=='43' then--德国
	return '49'
elseif new[2]=='187' then--美国物理
	return '1'
elseif new[2]=='40' then--乌兹别克斯坦
	return '998'
elseif new[2]=='11' then--吉尔吉斯坦
	return '996'
elseif new[2]=='88' then--洪都拉斯
	return '504 '
elseif new[2]=='24' then--柬埔寨
	return '855'
elseif new[2]=='161' then--土库曼斯坦
	return '993'
elseif new[2]=='1' then--乌克兰
	return '380'
elseif new[2]=='90' then--尼加拉瓜
	return '505'
elseif new[2]=='7' then--马来西亚
	return '60'
elseif new[2]=='4' then--菲律宾
	return '63'
elseif new[2]=='103' then--牙买加
	return '876'
elseif new[2]=='46' then--瑞典
	return '46'
elseif new[2]=='48' then--荷兰
	return '31'
elseif new[2]=='5' then--缅甸
	return '95'
elseif new[2]=='34' then--爱沙尼亚
	return '372'
elseif new[2]=='15' then--波兰
	return '48'
elseif new[2]=='72' then--蒙古
	return '976'
elseif new[2]=='6' then --印度尼西亚
	return '62'
elseif new[2]=='11' then --吉尔吉斯斯坦
	return '996'
else
	dialog('未知国家代码')
	lua_exit()
end
end

function 获取手机号和ID4()
获取5simKEY值()
国家代码4=获取国家代码4()
--dialog("获取国家代码:"..国家代码)
--mSleep(1000)
local wet= httpGet(values.电话号接口4,20)
new = tostring(wet):split(":")
--dialog("获取到的号码状态："..wet)
while (true) do
	if new[1]=='ACCESS_NUMBER' then 
		激活ID4=new[2]
		电话号码=string.gsub(new[3],国家代码4,"",1):atrim()
--	dialog("电话号码:"..电话号码)
		mSleep(1000)
		发送状态4('1')
		return 电话号码
	elseif new[1]=='NO_NUMBERS' then
		dialog('没有号码')
		lua_exit()
		--toast('没有号码',3)
	elseif new[1]=='NO_BALANCE' then
		dialog('余额不足')
		lua_exit()
	else
		toast('获取手机号失败',3)
		mSleep(2000)
		全局变量1=2
	end
end
end

function 发送状态4(状态)--string ,1-通知已发送短信   6.激活成功   8.激活失败
wet= httpGet('http://api1.5sim.net/stubs/handler_api.php?api_key='..sim_api_key值..'&action=setStatus&status='..状态..'&id='..激活ID4)
end

function 获取验证码4()
local webdata,tmp,验证码
for var= 1,20 do 
	webdata = httpGet('http://api1.5sim.net/stubs/handler_api.php?api_key='..sim_api_key值..'&action=getStatus&id='..激活ID4,5)
	if webdata == 'STATUS_WAIT_CODE' or webdata == "STATUS_WAIT_RETRY" then	
		mSleep(3000)
	else
		break
	end
	if (isColor( 69,  475, 0xfe2c55, 85)) then
		tap(113+math.random(0,5),  478+math.random(0,5)) --点击重新发送
	else
		mSleep(1000)
	end
end

tmp=webdata:split(':')
local res,_ = webdata:gsub("%D+","")    	--使用正则匹配验证码

if tmp[1]=='FULL_SMS' or tmp[1]=='STATUS_OK' then
	发送状态4('6')
	if values.软件版本 == '0' then
		验证码 = string.sub(res,1,4) 		--4位数验证码 
	else
		验证码 = string.sub(res,1,6) 		--6位数验证码 
	end
	mSleep(1000)
	return 验证码
else
	toast('获取验证码失败',1)
	全局变量1=2
end
end


--------------------------------------------------------翠球邮箱注册------------------------------------------------------------------------------------------------
function 获取邮箱列表()           --所属邮箱
header_send = {typeget = "iOS"}
body_send = {
["token"] = values.脆球密钥,
["domain_id"] = values.domain_id,
["page"] = "1",
["limit"] = "10",
}
ts.setHttpsTimeOut(60) 
code,status_resp, body_resp = ts.httpsPost("https://domain-open-api.cuiqiu.com/v1/mail/list", header_send, body_send)
--dialog(body_resp,0)
end

function 获取email列表()   --邮件的列表
    --首先获取当前的时间
for var=1,5 do
    tim = getNetTime(); 		
    time_year = os.date("%Y",tim)			--格式化 time 值获取年
    time_M = os.date("%m",tim) 		 	    --格式化 time 值获取月
    time_D = os.date("%d",tim) 		 	    --格式化 time 值获取天
    -- dialog(os.date("%Y年%m月%d日%H点%M分%S秒",time))  
    time_H = os.date("%H",tim) 
    
    time_HA = time_H+15   --洛杉矶时区   --H
    --dialog(time_HA)
    if time_HA > 24 then        -- H 超过24小时，则日期增加一天
        time_HZ = time_HA-15
        time_DM = time_D+1
    elseif time_HA <= 24 then   --小于等于24则表示为当天
        time_HZ = time_HA
        time_DM = time_D
    else
        toast("时间格式有误")
    end
    
    time_DMA = time_DM+1
    
    if string.len(time_DM) < 2  then       --当日期字符串长度小于2位数时，则添加 “0” ，示例 1 --> 01，否则保持默认
        time_DM = "0"..time_DM
        --dialog("当前日期："..time_DM)
    else     
        toast("获取开始时间失败")
    end
    
    if string.len(time_DMA) < 2 then        --当日期字符串长度小于2位数时，则添加 “0” ，示例 1 --> 01，否则保持默认
        time_DMA = "0"..time_DMA
        --dialog("结束日期："..time_DMA)   
    else     
        toast("获取结束时间失败")
       -- 全局变量1=3
    end
    
    start_time = (os.date("%Y-%m-".. time_DM.. " " .. time_HZ..":%M:%S",tim):split(" "))[1]
    end_time = (os.date("%Y-%m-" ..time_DMA.. " ".. time_HZ ..":%M:%S",tim):split(" "))[1]
    -- dialog(start_time)
    -- dialog(end_time)
    toast("start_time："..start_time)
    mSleep(1000)
    toast("end_time："..end_time)
    mSleep(1000)
    
    if start_time ~="" and end_time ~="" and time_year == "2022" then
        break
    elseif start_time ~="" and end_time ~="" and time_year ~= "2022" then
        toast("获取时间失败,请检查当前网络："..start_time.."-"..end_time,2)
        全局变量1=2
    else
        toast("获取时间失败")
        mSleep(1000)
        全局变量1=2
    end
end

header_send = {typeget = "iOS"}
body_send = {
["token"] = values.脆球密钥,
["mail_id"] = values.mail_id,
["domain_id"] = values.domain_id,
["start_time"] = start_time,
["end_time"] = end_time
}

ts.setHttpsTimeOut(60)  --超时时间
for var=1,10 do
    code,status_resp, body_resp = ts.httpsPost("https://domain-open-api.cuiqiu.com/v1/box/list", header_send, body_send)
    toast(body_resp)
    local 分割数据 = body_resp:split(":")
    EmailAll =分割数据[14]
    local Email = (EmailAll:split(","))[1]
    --dialog(Email)
    local res,_ = Email:gsub('"',"")
    返回邮箱号码 = string.sub(res,1,27)
    --dialog(邮箱号码)
    --return 返回邮箱号码
    toast("对比邮箱："..邮箱号码.."----"..返回邮箱号码)
    mSleep(3000)
        if tostring(邮箱号码) == tostring(返回邮箱号码) then
            --toast("账号一致，开始获取box_id",2)
            local id所在区域 = 分割数据[7]
            --dialog("id所在区域"..id所在区域)
            local res,_ = id所在区域:gsub("%D+","")
            Box_id = string.sub(res,1,7)
            --dialog("Box_id："..Box_id)
            return Box_id
        else
            toast("重新获取数据，未获取到指定邮箱数据")
            mSleep(1000)
        end
end
全局变量1=2
end

function 获取email内容()
获取email列表()
header_send = {typeget = "iOS"}
body_send = {
    ["token"] = values.脆球密钥,
    ["mail_id"] = values.mail_id,
    ["box_id"] = Box_id,
}
ts.setHttpsTimeOut(160) 
code,status_resp, body_resp = ts.httpsPost("https://domain-open-api.cuiqiu.com/v1/box/detail", header_send, body_send)
-- dialog("进入获取email流程："..body_resp)
local tmp = json.decode(body_resp)
local reg_all = tmp.data.content.subject
--dialog(reg_all)
local res,_ = reg_all:gsub('%D+',"")
验证码 = string.sub(res,1,6)
toast("获取到验证码:"..验证码)
return 验证码
end

function 随机脆球后缀()
local str1 ="abcdefghijklmnopqrstuvwxyz"
local options = {
	["tstab"] = 1, 
	["num"] = math.random(4,7),
}
local ret=getRndStr(str1,options)
return ret
end
------------------------------------------------------------------------------------------------------------------------------------------------------------







--记录账号信息到本地--
function 记录账号信息()
--      如果是手机号——记录手机号码、token，用于排查未注册的账号，仅做记录功能
--   	dialog("进入流程")
--    	dialog(电话号码)
--    	mSleep(1000)
--    	dialog(获取验证码地址)
--    	dialog(名字)
--    	dialog(密码)
--    	mSleep(1000)
--	    新增区号记录
	local tim = getNetTime();
	local 时间 = os.date("%Y年%m月%d日")
	mSleep(3000)
if values.注册类型 =="1" then
	local 区号
	if values.号码地区 == '0' then  --印尼
		区号 = '+62'
	elseif values.号码地区 == '1' then --俄罗斯
		区号 = '+7'
	elseif values.号码地区 == '2' then --美国
		区号 = '+1'
	elseif values.号码地区 == '3' then --柬埔寨
		区号 = '+855'
	end
	记录内容 = tostring(区号).."|".. tostring(电话号码).."|".. tostring(获取验证码地址).."----".. tostring(名字).."----".. tostring(密码).."----".. "当前设备的时间：".. tostring(时间)
	--dialog("电话号码:"..电话号码)
elseif values.注册类型 =="0" then
    记录内容 = tostring(返回邮箱号码).."----".. tostring(名字).."----".. tostring(密码).."----".. "当前设备的时间：".. tostring(时间)
elseif values.注册类型 =="2"  then
    记录内容 = tostring(INS账号).."----".. tostring(INS密码)
end
	mSleep(1000)
	if  values.脚本功能 == '4' then
	    记录数据('INS--账密错误账号.log',记录内容)
	else
	    记录数据('INS--已注册手机号.log',记录内容)
	end
	
	toast("已经记录信息")
	mSleep(2000)
end
--修改格式为“----”  2022-06-11 更新

-- function 移动cookies()
--     creatflag = ts.hlfs.makeDir('/private/var/mobile/Media/INSCookies/')  --新建文件夹
--     function movefile(path,to)
--         os.execute("mv "..path.." "..to);
--     end
    
--     --1、检测指定文件是否存在
--     function file_exists(file_name)
--         local f = io.open(file_name, "r")
--         return f ~= nil and f:close()
--     end
    
--     --定义cookies文件的保存路径
--         local 老路径
--         if values.脚本功能 == '1' then
--             谷歌浏览器数据路径 = appDataPath("com.google.chrome.ios")  
--             谷歌浏览器cookie文件路径 = 谷歌浏览器数据路径..'Library/Cookies'
--             老路径 = 谷歌浏览器cookie文件路径..'/Cookies.binarycookies'
--         elseif values.脚本功能 == '2' then 
--             火狐浏览器数据路径 = appDataPath("org.mozilla.ios.Firefox")
--             火狐浏览器cookie文件路径 = 火狐浏览器数据路径..'/Library/Cookies'
--             老路径 = 火狐浏览器cookie文件路径..'/Cookies.binarycookies'
--         else
--             mSleep(1000)
--             dialog("暂时不支持此类型")
--         end
    
--     oldpath = 老路径
--     -- newpath = '/private/var/mobile/Media/INSCookies/'..随机用户名()..'.binarycookies'
--     -- dialog(名字)
--     newpath = '/private/var/mobile/Media/INSCookies/'..名字..'.binarycookies'
--     bool = file_exists(oldpath)
--     if bool then
--         mSleep(2000)
--         movefile(oldpath,newpath)
--         toast("cookies文件已经保存")
--     else
--         dialog("文件不存在")
--     end
-- end


-------------移动文件方法------------
function 移动文件(新建文件路径,oldpath,newpath)
    creatflag = ts.hlfs.makeDir(新建文件路径)  --新建文件夹
    function movefile(path,to)
        os.execute("mv "..path.." "..to);
    end
    
    --1、检测指定文件是否存在
    function file_exists(file_name)
        local f = io.open(file_name, "r")
        return f ~= nil and f:close()
    end
    -- oldpath = 老路径
    -- newpath = '/private/var/mobile/Media/INSCookies/'..名字..'.binarycookies'
    bool = file_exists(oldpath)
    if bool then
        mSleep(2000)
        movefile(oldpath,newpath)
        toast("cookies文件已经保存")
    else
        dialog("文件不存在")
    end
end


----------本地文件登录处理------------------
--读取账号和密码   --将指定文件中的内容按行读取  分隔符 “ | ”
local ts = require("ts")
function 读取首行()
	function readFile(path)
    local file = io.open(path,"r");
		if file then
			local _list = {};
			for l in file:lines() do
				table.insert(_list,l)
			end
			file:close();
			return _list
		end
	end
	--检测指定文件是否存在
	function file_exists(file_name)
		local f = io.open(file_name)	
		--f:close()
		return f ~= nil and f:close()
	end
	bool = file_exists(values.登录文件路径)
	if bool then
	    list = readFile(values.登录文件路径)
    	if #list > 0 then
    		--for  i=1, #list,1  do
    		for  i=1, 1,1  do
    			local 首行 = list[i]
    			local str = 首行:split("----")
    			INS账号 = str[1]
    			INS密码 = str[2]:rtrim()
    			toast("账密：" .. tostring(INS账号) .. "----" .. tostring(INS密码))
    			mSleep(1000)
-- 			    toast("密码是："..  tostring(INS密码))
    		end
    	else
		   dialog("文件内容为空")
		   lua_exit()
    	end
	else
		dialog("文件不存在",0)
		lua_exit()
	end
end

-------删除首行：先读取文件到table，然后修改，再清除文件内容，最后重载写入到文件
local 文件路径 = values.登录文件路径
function 读取文本(file)
	local fileTab = {}
	local line = file:read()
	while line do
		--dialog("获取行数据"..line)
		table.insert(fileTab,line)
		line = file:read()
	end
	return fileTab
end

function 写入文件(file,fileTab)
	for i , line in pairs(fileTab) do
-- 		toast("开始写入"..line)
		file:write(line)
		file:write("\n")
	end
end

function 删除首行()
	toast("开始删除首行")
	local 打开文件 = io.open(文件路径)
	if 打开文件 then
		local tab = 读取文本(打开文件)
		打开文件:close()
		table.remove(tab,1)
		local 文件替换 = io.open(文件路径,"w")
		if 文件替换 then 
			写入文件(文件替换,tab)
			文件替换:close()
		end
	end
end




----------------移动token文件-----------------------      --当前为写死，可定义为方法
function 移动token文件()    
    function getList(path)                    --遍历文件夹内容
        local a = io.popen("ls "..path);
        local f = {};
        for l in a:lines() do
            table.insert(f,l)
        end
        a:close()
        return f
    end
    
    list = getList('/private/var/mobile/FFFaker/Instagram/');    --路径写死
    if #list > 0 then
        for  i=1, #list,1  do
            toast(list[i])    --获取文件名称
        end
    else
        dialog("文件夹路径不存在")
    end
    
    local  token文件 = list[1] 
    toast(token文件)
  
  
    creatflag = ts.hlfs.makeDir('/private/var/mobile/Media/INSTokens/')  --新建文件夹
  
    function movefile(path,to)
        os.execute("mv "..path.." "..to);    --移动文件shell命令
    end
    
    --1、检测指定文件是否存在
    function file_exists(file_name)
        local f = io.open(file_name, "r")
        return f ~= nil and f:close()
    end
    
    --定义token文件的保存路径
    oldpath = '/private/var/mobile/FFFaker/Instagram/'..token文件
    -- dialog(oldpath)
    newpath = '/private/var/mobile/Media/INSTokens/'..INS账号..'----'..token文件    --新文件前缀+文件名称
    -- dialog(newpath)
    bool = file_exists(oldpath)
    if bool then
        mSleep(2000)
        movefile(oldpath,newpath)
        toast("Token文件已经保存")
    else
        dialog("文件不存在")
    end
end



function 复制文件(oldpath,newpath)   --定义方法，输入文件路径  --String  例如 ： 复制文件("/private/var/mobile/Media/keychain-2.db","/private/var/Keychains/keychain-2.db")
    --检测指定文件是否存在
    function file_exists(file_name)
        local f = io.open(file_name, "r")
        return f ~= nil and f:close()
    end
    --复制文件
    function copyfile(path,to)
        os.execute("cp -rf "..path.." "..to);
    end
    bool = file_exists(oldpath)
    if bool then
        copyfile(oldpath,newpath)
        toast("文件已经复制")
    else
        dialog("文件不存在",0)
    end
end
