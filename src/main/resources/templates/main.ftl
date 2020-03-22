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
    <a class="btn btn-primary" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Добавить новый опрос
    </a>
    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group mr-auto bg-warning" style="width:400px">
                    <input class="form-control" name="text" placeholder="Введите сообщение" type="text"/>
                </div>
                <div class="form-group mr-auto bg-warning" style="width:400px">
                    <input type="text" class="form-control" name="tag" placeholder="Тэг">
                </div>
                <div class="form-group mr-auto bg-warning" style="width:400px">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Выберите файл</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div class="form-group">
                    <button type="submit" class="btn btn-primary">Добавить</button>
                </div>
            </form>
        </div>
    </div>

    <div class="card-columns">
        <#list messages as poll>
            <div class="card my-3">
                <div>
                    <#if poll.filename??>
                        <img src="/img/${poll.filename}" class="card-img-top" alt="">
                    </#if>
                </div>
                <div class="m-2">
                    <span>${poll.text}</span>
                    <i>${poll.tag}</i>
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

