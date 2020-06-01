<#import "parts/common.ftl" as c>

<@c.page>
    <h5>Редактор пользователей</h5>
    <form action="/user" method="post">
        <h6>Вы редактируете пользователя: ${user.username}</h6>

        <#list roles as role>
            <div>
                <input type="checkbox" type="checkbox" name="${role}"${user.roles?seq_contains(role)?string("checked","")}>${role}<br/>
            </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userId">
        <input type ="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Сохранить</button>
    </form>
</@c.page>