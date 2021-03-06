<#include "security.ftl">
<#import 'login.ftl' as l>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <a class="navbar-brand" href="#">Social</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
            aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <#if name="">
                <li class="nav-item">
                    <a class="nav-link" href="/">Домашняя страница</a>
                </li>
            </#if>
            <#if name != "">
                <li class="nav-item">
                    <a class="nav-link" href="/main">Опросы</a>
                </li>
            </#if>
            <#if isAdmin>
                <li class="nav-item">
                    <a class="nav-link" href="/user">Список пользователей</a>
                </li>
            </#if>
        </ul>
        <div class="navbar-text mr-3">${name}</div>
        <#if name = "">
            <a class="btn btn-primary ml-2" href="/registration" role="button">Зарегистрироваться</a>
            <a class="btn btn-primary ml-2" href="/login" role="button">У меня уже есть аккаунт</a>
        </#if>
        <#if name != "">
            <@l.logout />
        </#if>
    </div>
</nav>