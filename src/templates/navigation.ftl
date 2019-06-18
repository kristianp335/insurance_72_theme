<#if !show_dockbar>
	<nav class="sort-pages modify-pages navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav" role="navigation" style="margin-top: 0px">
<#else>
	<nav class="sort-pages modify-pages navbar navbar-expand-lg navbar-light fixed-top navbar-shrink" id="mainNav" role="navigation">
</#if>
	<div class="container">
		<a class="${logo_css_class} navbar-brand js-scroll-trigger" href="${site_default_url}" title="<@liferay.language_format arguments="${site_name}" key="go-to-x" />">
			<#if show_logo_image>
				<img alt="${logo_description}" height="60" src="${site_logo}" />
			</#if>

			
		</a>

		<button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto" aria-label="<@liferay.language key="site-pages" />" role="menubar">
				<#list nav_items as nav_item>
					<#assign
						nav_item_attr_selected = ""
						nav_item_css_class = ""
						nav_item_layout = nav_item.getLayout()
					/>

					<#if nav_item.isSelected()>
						<#assign
							nav_item_attr_selected = "aria-selected='true'"
							nav_item_css_class = "selected"
						/>
					</#if>

					<li ${nav_item_attr_selected} class="${nav_item_css_class} nav-item" id="layout_${nav_item.getLayoutId()}" role="presentation">
						<a aria-labelledby="layout_${nav_item.getLayoutId()}" class="nav-link js-scroll-trigger" href="${nav_item.getURL()}" ${nav_item.getTarget()} role="menuitem"><span><@liferay_theme["layout-icon"] layout=nav_item_layout /> ${nav_item.getName()}</span></a>
					</li>
				</#list>

				<#if !is_signed_in>
					<li class="nav-item" role="presentation">
						<a class="nav-link" data-redirect="${is_login_redirect_required?string}" href="javascript:void(0)" onclick="$('#loginCardContainer').css('visibility', 'visible');" id="sign-in" rel="nofollow">${sign_in_text}</a>
					</li>
				</#if>
				<#if is_signed_in>
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="${sign_out_url}" id="sign-out" rel="nofollow">${sign_out_text}</a>
					</li>
				</#if>
				<#assign preferences = freeMarkerPortletPreferences.getPreferences({"portletSetupPortletDecoratorId": "barebone", "destination": "/search"}) />
				<li>						
					<div class="justify-content-md-end mr-4 navbar-form" role="search">
									<@liferay.search_bar default_preferences="${preferences}" />
					</div>		
				</li>				
				<#if is_signed_in>
					<li>						
						<@liferay.user_personal_bar />			
					</li>
				</#if>
			</ul>
		</div>
	</div>
</nav>
<div id="loginCardContainer" style="background: rgba(0, 0, 0, 0.5); height: 100%; width: 100%; z-index: 1500; position: fixed; top: 0; left: 0; visibility: hidden;">
	<div style="margin-left: 90%; margin-right: 20px; margin-top: 20px; position: relative;">
		<a class="btn btn-primary" href="javascript:void(0)" onclick="$('#loginCardContainer').css('visibility', 'hidden');" id="hide-sign-in" rel="nofollow">X</a>
	</div>
	<div class="b2b-login-card card" id="loginCardArea" style="background-color: #ffffff; min-width:300px; max-width: 400px; position: fixed; top: 25%;
		left: 50%; transform: translate(-50%, 0); z-index: 2000; padding: 20px;">	
			<#assign preferences = freeMarkerPortletPreferences.getPreferences("portletSetupPortletDecoratorId", "barebone") />
			<@liferay_portlet["runtime"]
				defaultPreferences=preferences
				portletName="com_liferay_login_web_portlet_LoginPortlet"
			/>
	</div>
<div>