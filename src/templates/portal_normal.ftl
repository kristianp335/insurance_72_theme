<!DOCTYPE html>

<#include init />

<html class="${root_css_class}" dir="<@liferay.language key="lang.dir" />" lang="${w3c_language_id}">

<head>
	<title>${the_title} - ${company_name}</title>

	<meta content="initial-scale=1.0, width=device-width" name="viewport" />

	<@liferay_util["include"] page=top_head_include />

	<link href='https://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
</head>

<body class="${css_class}">

<#if show_dockbar>
	<@liferay.control_menu />	
</#if>

<div class="pt-0" id="wrapper">
	<header id="banner" role="banner">
		<#include "${full_templates_path}/navigation.ftl" />		
	</header>
<#if show_dockbar>
	<section class="pt-0" id="content" style="margin-top: 155px;">
</#if>
<#if !show_dockbar>
	<section class="pt-0" id="content" style="margin-top: 95px;">
</#if>
		<#if show_temporal_content>
			<#include "${full_templates_path}/temporal_content.ftl" />
		</#if>

		<#if selectable>
			<div class="container-fluid">
				<@liferay_util["include"] page=content_include />
			</div>
		<#else>
			${portletDisplay.recycle()}

			${portletDisplay.setTitle(the_title)}

			<@liferay_theme["wrap-portlet"] page="portlet.ftl">
				<@liferay_util["include"] page=content_include />
			</@>
		</#if>
	</section>
</div>



<@liferay_util["include"] page=body_bottom_include />

<@liferay_util["include"] page=bottom_include />

<script src="${javascript_folder}/vendor/jquery-easing/jquery.easing.js"></script>
<script src="${javascript_folder}/vendor/magnific-popup/jquery.magnific-popup.js"></script>
<script src="${javascript_folder}/vendor/scrollreveal/scrollreveal.js"></script>
<script src="${javascript_folder}/vendor/creative.js"></script>

<!-- inject:js -->
<!-- endinject -->

</body>

</html>