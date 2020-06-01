<#import "parts/common.ftl" as c>

<@c.page>
    <h6>Список пользователей</h6>
    <table class="table">
        <thead>
        <tr>
            <th scope="col">Имя пользователя</th>
            <th scope="col">Роль</th>
            <th></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td> ${user.username} </td>
                <td><#list user.roles as role>${role} <#sep>, </#list> </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>