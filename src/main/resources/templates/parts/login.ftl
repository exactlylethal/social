<#macro login path isRegisterForm>
    <form action="${path}" method="post">
        <div class="form-group row">
            <label class="col-sm-1 col-form-label mt-1">Логин :</label>
            <div class="col-sm-6 mt-1">
                <input type="text" name="username" class="form-control" placeholder="Введите логин" />
            </div>
        </div>
        <div class="form-group row ">
            <label class="col-sm-1 col-form-label">Пароль:</label>
            <div class="col-sm-6 mr-auto">
                <input type="password" name="password" class="form-control" placeholder="Введите пароль" />
            </div>
        </div>
        <#if isRegisterForm>
            <div class="form-group row">
                <label class="col-sm-1 col-form-label">Почта:</label>
                <div class="col-sm-6">
                    <input type="email" name="email" class="form-control" placeholder="Введите вашу почту" />
                </div>
            </div>
        </#if>
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit"><#if isRegisterForm>Create<#else>Войти</#if></button>
    </form>
</#macro>


<#macro logout>
    <form action="/logout" method="post">
        <input type="hidden" name="_csrf" value="${_csrf.token}" />
        <button class="btn btn-primary" type="submit">Выйти</button>
    </form>
</#macro>


