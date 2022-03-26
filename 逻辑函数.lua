function 切换VPN()--启动小火箭  --判定打开VPN  --切换VPM  -- 判定有无网络
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
--		if (isColor( 643,  204, 0x2473bd, 85)) then  --旧版本
		if (isColor( 612,  209, 0x2372bd, 85)) then
			break
		else
			tap(643,204)
			mSleep(2000)
		end
	end
	for i= 0,7 do --判断节点数量
		--x,y = findColorInRegionFuzzy(0x000000,100,118,558+i*88,219,589+i*88) --旧版本不需要更改
		x,y = findColorInRegionFuzzy(0xffffff ,100,649,628+i*88, 678,1096+i*88)
		if x<0 then --说明没有节点了
			节点数量=i
			break
		end
	end
	local 随机节点序
	if 节点数量~=1 then
		for var= 1,10 do
			随机节点序=math.random(0,节点数量-1)--去重复，万一随机的还是那个呢
--			if (isColor(13,581+随机节点序*88,0xff9400,85)) then      --旧版本
            if (isColor(  43,  638+随机节点序*88, 0xff9400, 85)) then  --页面适配    
			else
				break
			end
		end 
--		tap(325,574+随机节点序*88)    --旧版本
		tap(346,627+随机节点序*88) 
		mSleep(2000) 
	end
	--判断有没有网络
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
	mSleep(3000)
	toast("确认新机 ")
	mSleep(6000)
end


function INSAPP注册()
	--打开INS应用  自动进入到了INS注册主界面  
	while (true) do
		local 当前界面=检索界面(INS注册界面列表)
		if 当前界面 == "INS注册开屏界面" then
			tap(创建用户按钮X+math.random(1,10),创建用户按钮Y+math.random(1,10))
			mSleep(500)
		elseif 当前界面 == "INS注册登录界面" then
			--点击注册按钮
			tap(注册按钮X+math.random(1,10),注册按钮Y+math.random(1,10))
			mSleep(500)
		elseif 当前界面 =='浏览器允许保存cookie页面' then
		    mSleep(1000)
		    tap(允许所有X+math.random(1,5),允许所有Y+math.random(1,5))
		    mSleep(500)
		elseif 当前界面 == "INS注册手机号注册界面" then
			mSleep(500)
			if values.号码地区 == '0' then 
				tap(163,365)
				for var= 1, 10 do     --印尼地区+62
					向上翻页()
					--mSleep(100)
				end
				tap(389, 670)
				mSleep(500)
			elseif values.号码地区 == '1' then
				tap(163,365)
				for var= 1, 17 do     --俄罗斯地区+7
					向上翻页()
				end
				tap( 335,  820)
			elseif values.号码地区 == '3' then
				tap(163,365)
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
			
		elseif 当前界面 == "INS注册验证码界面" then
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
			tap(验证码下一步X,验证码下一步Y)
			mSleep(14000)
			
		elseif 当前界面 == "INS注册手机号出错界面" then
			--清除输入框内容
			tap(清除按钮X,清除按钮Y)
			mSleep(500)
		elseif 当前界面 == "INS注册设置用户名界面" then 
			mSleep(3000)			
			if values.文件名称 == '' then
				mSleep(500)
				名字 = 随机用户名()
			else
				toast("获取到文件！")
				名字 = 随机用户昵称()
			end
			tap(657,373)
			mSleep(800)
			输入文本(用户名输入框X,用户名输入框Y,名字)
			mSleep(3000)
			tap(NEXT按钮X,NEXT按钮Y)
		elseif 当前界面 == "INS注册设置密码界面" then 
			mSleep(1000)
			随机账号密码()
			mSleep(1000)
			输入文本(密码输入框X,密码输入框Y,密码)
			mSleep(2000)
			tap(443+math.random(1,10), 397+math.random(1,10))  --点击下一步
			mSleep(500)
		elseif 当前界面 == "INS注册记住登录信息界面" then 
--			tap(486, 1192)  -- remenber
--			mSleep(500)
			tap(368,1292)  -- not now
			mSleep(3000)
		elseif 当前界面 == "INS注册选择生日界面" then
			选择生日()
			tap(注册next生日X,注册next生日Y) 
			mSleep(6000)
		elseif 当前界面 == "INS注册设置昵称界面" then
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
					名字 = 随机用户名()
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
				tap(642,  358) --点击 随机 按钮
			end
		elseif 	当前界面 == "INS注册确定界面" then 
			tap(472,  342)  --点击sign up
			mSleep(5000)		
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
		elseif 当前界面 == "INS注册成功主界面" then
			tap(668, 1282) --点击 “我”
			mSleep(500)
		elseif 当前界面 == "INS浏览器个人主页界面" then
			break
		else
			mSleep(1000)
		end
	end
end


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
    	mSleep(3000)
        while (true) do
            local 当前界面=检索界面(INS注册界面列表)
         	if 当前界面 == "火狐浏览器首次登录页面" then
         	    mSleep(1000)
         	    tap(火狐浏览器首次登录X,火狐浏览器首次登录Y)
         	    mSleep(2000)
        	elseif 当前界面 == "火狐浏览器设备共享页面" then
         	    mSleep(1000)
         	    tap(火狐浏览器设备共享页面开始浏览器X,火狐浏览器设备共享页面开始浏览器Y)
         	    mSleep(2000)         	  
         	else
         	    break
         	end
        end
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
    	 mSleep(2000)
    else
        mSleep(1000)
    end
end




function INS浏览器注册()
	--打开INS应用  自动进入到了INS注册主界面  
    while (true) do
		local 当前界面=检索界面(INS注册界面列表)
		if  当前界面 == "google浏览器主页界面" then     --输入地址，需要优化
        	mSleep(2000)
            输入文本(357,501,"www.instagram.com")
        	mSleep(1000)
        	tap(646,1289)
        	mSleep(1000)
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
		    tap(注册界面2X,注册界面2Y)
		    mSleep(500)
		elseif 当前界面 == "INS浏览器报错界面" or 当前界面 == "INS浏览器网络报错界面"  then
		    mSleep(500)
            toast("流程报错，脚本重新开始")
           -- mSleep(120000)
            全局变量1=3
-- 		elseif 当前界面 == "INS浏览器网络报错界面"  then
-- 		    mSleep(1000)
--             toast("流程报错，等待2分钟之后重新开始")
--             全局变量1=2

		elseif 当前界面 == "INS浏览器注册界面" then
		    mSleep(200)
            if values.号码地区 == '0' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                if values.脚本功能 =='1' then 
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"India")
                    mSleep(2000)
                    tap(236,447)    --点击印尼
                    mSleep(500)
                elseif values.脚本功能 =='2' then 
                    输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"India")
                    mSleep(2000)
                    tap(236,373)    --点击印尼
                    mSleep(500)
                end
                
            elseif values.号码地区 == '1' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                if values.脚本功能 =='1' then 
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Russia")
                    tap(175,357)    --点击俄罗斯
                    mSleep(500)
                elseif values.脚本功能 =='2' then 
                    输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"Russia")
                    mSleep(2000)
                    tap(236,373)    --点击 俄罗斯
                    mSleep(500)
                end
                
            elseif values.号码地区 == '2' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                if values.脚本功能 =='1' then 
                    输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"United States")
                    tap(290,357)    --点击美国
                    mSleep(500)
                elseif values.脚本功能 =='2' then 
                    输入文本2(火狐浏览器选择地区输入框X,火狐浏览器选择地区输入框Y,"United States")
                    mSleep(2000)
                    tap(236,373)    --点击美国
                    mSleep(500)
                end
                
           elseif values.号码地区 == '3' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                if values.脚本功能 =='1' then 
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
			if (isColor(220, 438, 0xed4956, 90)) then
                toast("行为出错，重新开始脚本")
                mSleep(1000)
                全局变量1=2 
            end
			--判断是否离开该界面(INS注册界面列表,'INS浏览器注册界面')
		elseif 当前界面 == "INS浏览器接收验证码界面" then
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
-- 			for var= 1,7 do
-- 				tap(630,1276)
-- 				mSleep(500)
-- 			end
			mSleep(1000)	
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
			mSleep(1000)
			--dialog("获取到的验证码："..验证码) 
			输入文本2(355+math.random(1,10),492+math.random(1,10),验证码)
			tap(365,615)
			mSleep(8000)
        elseif  当前界面 == "INS浏览器设置用户名界面" then
            if values.文件名称 == '' then
                mSleep(500)
                名字 = 随机用户名()
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
        elseif  当前界面 == "INS浏览器设置生日界面" then
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
            for var=1,4 do
              moveTo(389,1255+math.random(0,5),411,1055+math.random(0,5)) --滑动年份
              mSleep(2000)
            end
            mSleep(3000)
            tap(679,862)    --点击done
            mSleep(1000)
            
            tap(364+math.random(0,10),949+math.random(0,10))
            mSleep(1000)
            
         elseif  当前界面 == "INS浏览器确认用户名界面" or  当前界面 == "INS浏览器确认用户名界面2" then
          tap(INS浏览器确认用户名NEXTX,INS浏览器确认用户名NEXTY)
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
    ------google---------
        elseif 当前界面 == "google浏览器ins注册首页界面" then
            tap(google浏览器ins注册按钮X,google浏览器ins注册按钮Y)
            mSleep(1000)
		elseif 当前界面 == "google浏览器ins注册手机号界面" then   --shipei
			mSleep(500)
			 if values.号码地区 == '0' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"India")
                tap(314,367)    --点击印尼
                mSleep(500)
            elseif values.号码地区 == '1' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Russia")
                tap(175,357)    --点击俄罗斯
                mSleep(500)
            elseif values.号码地区 == '2' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"United")
                tap(381,581)    --点击美国
                mSleep(500)
           elseif values.号码地区 == '3' then 
                tap(154,552)    --点击选择地区按钮
                mSleep(500)
                输入文本2(浏览器选择地区输入框X,浏览器选择地区输入框Y,"Cambodia")
                tap(219,363)  --点击柬埔寨
                mSleep(500)
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
        elseif 当前界面 == "google浏览器重新设置用户名界面" then
            mSleep(1000)
            tap(625,477)
            mSleep(2000)
            tap(414,619) --点击 Next
            mSleep(1000)
        elseif 当前界面 == "google浏览注册error页面" then
            全局变量1=3  --出错页面直接重新开始
            mSleep(1000)
         elseif 当前界面=='未知界面' then
             mSleep(2000)
        elseif  当前界面 == "INS浏览器个人主页界面" or 当前界面 == "火狐浏览器INS个人主页界面"  or 当前界面 == "INS界面个人主页2" then
          --注册完成
           tap(674,1206)
           mSleep(2000)
           全局变量1=1   --注册成功
           break
        else
           
        end
    	mSleep(1000)
    end
end



function 设置资料()
while (true) do   --修改链接
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








