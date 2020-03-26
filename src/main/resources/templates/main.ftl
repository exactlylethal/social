<#import "parts/common.ftl" as c>


<@c.page>
    <div class="form-row mt-3">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                    <input type="text" name="filter" class="form-control" value="${filter!""}" placeholder="Найти по тэгу">
                <button type="submit" class="btn btn-primary ml-2"> Найти</button>
            </form>
        </div>
    </div>

    <a class="btn btn-primary" href="/poll" role="button">
        Добавить новый опрос
    </a>



    <div class="card-columns">
        <#list messages as message>
            <div class="card my-3">
                <div>
                    <#if message.filename??>
                        <img src="/img/${message.filename}" class="card-img-top" alt="">
                    </#if>
                </div>
                <div class="m-2">
                    <#if message.></#if>
                    <span>${message.text}</span>
                </div>
                <div class="card-footer text-muted">
                    Автор: ${message.authorName}
                </div>
            </div>
        <#else>
            В данный момент опросов нет
        </#list>
    </div>
</@c.page>

