<#import "parts/common.ftl" as c>
<@c.page>
    <div class="form-row mt-3">
        <div class="form-group col-md-6">
            <form method="get" action="/main" class="form-inline">
                <input type="text" name="filter" class="form-control" value="${filter!""}"
                       placeholder="Найти по названию">
                <button type="submit" class="btn btn-primary ml-2"> Найти</button>
            </form>
        </div>
    </div>
    <div class="card-columns">
        <#list polls as poll>
            <div class="card my-3">
                <div class="m-2">
                    <h6><span>Название опроса: ${poll.name}</span><br/></h6>
                    <#if poll.author??>
                        <span>Автор опроса: ${poll.authorName}</span>
                    </#if>
                    <br/>
                    <a class="btn btn-primary" href="/showPoll?poll_id=${poll.id}" role="button">Перейти к опросу</a>
                </div>
            </div>
        <#else>
            Опросов нет
        </#list>
    </div>
    <a class="btn btn-primary" href="/pollCreate" role="button">
        Добавить новый опрос
    </a>
    </div>
</@c.page>

