<#import "parts/common.ftl" as c>
<@c.page>
    <div class="card-columns">
        <#list polls as poll>
            <div class="card my-3">
                <div class="m-2">
                    <#if poll.id??></#if>
                    <span>${poll.name}</span>
                </div>
                <div class="card-footer text-muted">
                    Автор: ${poll.authorName}
                </div>
            </div>
        <#else>
            В данный момент опросов нет
        </#list>
    </div>
</@c.page>