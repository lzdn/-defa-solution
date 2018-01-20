<#macro left>
<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="nav-close"><i class="fa fa-times-circle"></i></div>
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <span><img alt="image" class="img-circle" src="${basePath}/static/img/profile_small.jpg" /></span>
                    <a data-toggle="dropdown" class="dropdown-toggle" href="javascript:void(0);" >
						<span class="clear">
	                       	<span class="block m-t-xs">
	                      		<strong class="font-bold">
                                     <#if (Session.LoginUser)??>${Session.LoginUser.username!}</#if>
                                </strong>
	                       	</span>
	                       	<#if (Session.LoginUser)??&&(Session.LoginUser.roles)??&& (Session.LoginUser.roles)?size gt 0 >
		                       	<#list Session.LoginUser.roles as role >
									<span class="text-muted text-xs block">
										<label>${role.roleName}</label>
											<b class="caret"></b>
									</span>
								</#list>
							</#if>
						</span>
                    </a>
                    <ul class="dropdown-menu animated fadeInRight m-t-xs">
                        <li>
                            <a class="J_menuItem"  href="${basePath}/user/avatar">修改头像</a>
                        </li>
                        <li>
                            <a class="J_menuItem"  href="${basePath}/user/profile">个人资料</a>
                        </li>
                       <!--  <li>
                            <a class="J_menuItem"  href="contacts.html">联系我们</a>
                        </li> -->
                        <li>
                            <a class="J_menuItem"  href="${basePath}/user/mailbox">信箱</a>
                        </li> 
                        <li class="divider"></li>
                        <li>
                            <a href="${basePath}/logout">安全退出</a>
                        </li>
                    </ul>
                </div>
                <div class="logo-element">W</div>
            </li>
            <li>
                <a href="javascript:void(0);">
                    <i class="fa fa-home"></i>
                    <span class="nav-label">主页</span>
                    <span class="fa arrow"></span>
                </a>
                <ul class="nav nav-second-level">
                    <li>
                        <a class="J_menuItem" href="${basePath}/index" data-index="0">Dashbard</a>
                    </li>
                </ul> 
            </li>
           <#if (Session.LoginUser)??&&(Session.LoginUser.menuGroups)??&& (Session.LoginUser.menuGroups)?size gt 0 >
           		<#list Session.LoginUser.menuGroups as group >
	           		<li>
		                <a href="javascript:void(0);">
		                    <i class="${group.icon}"></i>
		                    <span class="nav-label">${group.groupName}</span>
		                    <span class="fa arrow"></span>
		                </a>
		                <#if (group.menus)??&&group.menus?size gt 0>
			                <#list group.menus as menu >
			                <ul class="nav nav-second-level">
			                    <li>
			                        <a class="J_menuItem" href="${menu.url}" data-index="0">${menu.menuName}</a>
			                    </li>
			                </ul>
			                </#list>
		                </#if>
		            </li>
           		</#list>
           </#if>
        </ul>
    </div>
</nav>
</#macro>