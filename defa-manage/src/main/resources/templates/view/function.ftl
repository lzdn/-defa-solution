<#function hasRight url>
	<#if (Session.LoginUser)??&&(Session.LoginUser.roles)??&&(Session.LoginUser.roles)?size gt 0 && url?? && url != ''>
		<#list Session.LoginUser.roles as role>
			<#if (role.rights)??&&(role.rights)?size gt 0>
				<#list role.rights as right>
					<#if url == right.rightUrl>
						<#return true>
					</#if>
				</#list>
			</#if>
		</#list>
	</#if>
	<#return false>   
</#function>