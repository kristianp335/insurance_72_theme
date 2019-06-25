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
<footer id="footer">
	<div class="row footer-row">
		<div class="col-sm footer-text">
		  <h5>Liferay UK &copy;2019<h5>
		</div>
		<div class="col-sm">
			<div class="component-social pb-4 footer-image-parent">
				<ul class="list-unstyled d-flex justify-content-center align-items-center mb-0">
					<li class="mx-2">
						<div title="">
							<img alt="Responsive Image" class = "footer-image" src="data:image/png;base64,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">
						</div>
					</li>
					<li class="mx-2">
						<div title="">
							<img alt="Responsive Image" class = "footer-image" src="data:image/png;base64,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">
						</div>
					</li>
					<li class="mx-2">
						<div title="">
							<img alt="Responsive Image" class = "footer-image" src="data:image/png;base64,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">
						</div>
					</li>
				</ul>
			</div>
		</div>
	</div>
</footer>


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