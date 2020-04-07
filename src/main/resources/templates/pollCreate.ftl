<#import "parts/common.ftl" as c>
<@c.page>
<div class="form-group mt-3">
<form method="post" enctype="multipart/form-data">

    <div class="form-group mr-auto bg-warning" style="width:400px">
        <input type="text" class="form-control"
               value="<#if poll??>${poll.name}</#if>" name="name" placeholder="Введите название вашего опроса">
        <#if nameError??>
            <div class="invalid-feedback">
                ${nameError}
            </div>
        </#if>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="button">Опубликовать</button>
</form>
</div>
</div>
</@c.page>