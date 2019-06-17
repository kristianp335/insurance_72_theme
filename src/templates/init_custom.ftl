<#assign
    show_logo_image = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-logo-image"))
    show_temporal_content = getterUtil.getBoolean(themeDisplay.getThemeSetting("show-temporal-content"))
/>

<#assign permission_checker = themeDisplay.getPermissionChecker() />

<#assign is_group_admin = permission_checker.isGroupAdmin(group_id) />
<#assign is_omniadmin = permission_checker.isOmniadmin() />

<#assign show_dockbar = is_group_admin || is_omniadmin />

<#if show_dockbar>
    <#assign wrapper_class_name = "" />
<#else>
    <#assign wrapper_class_name = "hide-dockbar" />
</#if>