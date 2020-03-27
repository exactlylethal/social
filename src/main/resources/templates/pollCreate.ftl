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
    <div class="form-group mr-auto bg-warning" style="width:400px">
        <div class="custom-file">
            <input type="file" name="file" id="customFile">
            <label class="custom-file-label" for="customFile">Выберите файл</label>
        </div>
    </div>
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button type="submit" class="btn btn-primary" href="/poll">Опубликовать</button>
</form>
</div>
</div>
</@c.page>