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
						<a class="nav-link" data-redirect="${is_login_redirect_required?string}" href="${sign_in_url}" id="sign-in" rel="nofollow">${sign_in_text}</a>
					</li>
				</#if>
				<#if is_signed_in>
					<li class="nav-item" role="presentation">
						<a class="nav-link" href="${sign_out_url}" id="sign-out" rel="nofollow">${sign_out_text}</a>
					</li>
				</#if>
				<#if is_signed_in>
					<li>						
						<@liferay.user_personal_bar />			
					</li>
				</#if>
			</ul>
		</div>
	</div>
</nav>