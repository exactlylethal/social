<#import "parts/common.ftl" as c>
<@c.page>
    <form method="post" enctype="multipart/form-data">
        <div class="form-group mr-auto bg-warning" style="width:400px">

            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                   value="<#if answer??>${answer.text}</#if>" name="text" placeholder="Введите вариант ответа"/>
            <#if textError??>

            <div class="invalid-feedback">
                ${textError}
                </#if>
            </div>

            <div class="form-group">
                <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                <input type="hidden" name="_poll_id" value=${poll_id}/>
                <button type="submit" class="btn btn-primary">Добавить вопрос</button>
                <a class="btn btn-primary" href="/main" role="button">Вернуться назад</a>
            </div>

        </div>
    </form>
</@c.page>