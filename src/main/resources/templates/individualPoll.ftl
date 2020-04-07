<#import "parts/common.ftl" as c>
<@c.page>
    <h2>Название опроса: ${poll.name}</h2>
    <#if poll.answers??>
        Ответы: <br>
        <#list poll.answers as answer>
            -${answer.text}.
            Ответ от пользователя: ${answer.authorName}
            <br>
        </#list>
    </#if>
<#if !showButton??>
            <div class="form-group mt-2">
                <a class="btn btn-primary" href="/question?poll_id=${poll.id}" role="button">Добавить новый ответ</a>
            </div>
</#if>
</@c.page>