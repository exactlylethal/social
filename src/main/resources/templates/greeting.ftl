<#import "parts/common.ftl" as c>

<@c.page>
<h2>Добро пожаловать!</h2>
    <div> </div>
    <h3>Вы попали на сайт Social. Данный сайт предназначен для проведения социальных опросов.</h3>
    <#if !user??>
    <div>Для того чтобы продолжить <a href="/registration" data-toggle="tooltip" title="регистрация">зарегистрируйтесь</a> или же
        <a href="/login" data-toggle="tooltip" title="логин">авторизуйтесь</a> в нашей системе.</div>
        <#else>
        <h5>Перейдите во вкладку опросы.</h5>
    </#if>
</@c.page>