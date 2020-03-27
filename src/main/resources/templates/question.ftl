<#import "parts/common.ftl" as c>
<@c.page>
    <form method="post" enctype="multipart/form-data">
        <div class="form-group mr-auto bg-warning" style="width:400px">
            <input type="text" class="form-control ${(textError??)?string('is-invalid', '')}"
                   value="<#if message??>${message.text}</#if>" name="text" placeholder="Введите вариант ответа"/>
            <#if textError??>
                <div class="invalid-feedback">
                    ${textError}
                </div>
            </#if>
        </div>
        <div class="form-group">
            <input type="hidden" name="_csrf" value="${_csrf.token}" />
            <button type="submit" class="btn btn-primary">Добавить вопрос</button>
        </div>
    </form>
</@c.page>