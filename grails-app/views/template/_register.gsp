<div class="inner-container">
    ${flash.message}
    <g:hasErrors bean="${user}">
        <div>
            <g:renderErrors bean="${user}"/>
        </div>
    </g:hasErrors>
    <g:form controller="user" action="registerHandler" enctype="multipart/form-data">
        <fieldset>
            <div class="line">
                <label for="firstName">First Name: </label>
                <g:textField name="firstName" value="${user?.firstName}"
                             class="${hasErrors(bean:user,field:'firstName','errors')}" />
            </div>
            <div class="line">
                <label for="lastName">Last Name: </label>
                <g:textField name="lastName" value="${user?.lastName}"
                             class="${hasErrors(bean:user,field:'lastName','errors')}" />
            </div>
            <div class="line">
                <label for="email">Email*: </label>
                <g:textField name="email" value="${user?.email}"
                             class="${hasErrors(bean: user,field: 'email','errors')}"/>
            </div>
            <div class="line">
                <label for="userName"> Username*: </label>
                <input type="text" name="userName" id="${hasErrors(bean:user,field:'userName','errors')}" value="${user?.userName}"/>
            </div>
            <div class="line">
                <label for="password">Password*: </label>
                <g:passwordField name="password"
                                 class="${hasErrors(bean:registerVlaidatorCO,field:'password','errors')}" />
            </div>
            <div class="line">
                <label for="confirm">Confirm Password*: </label>
                <g:passwordField name="confirm"
                                 class="${hasErrors(bean:registerVlaidatorCO,field:'password','errors')}" />
            </div>
            <div class="line"><label for="image">Photo</label>
                <input type="file" id="image" name="image">
            </div>
            <div class="line">
                <g:submitButton name="submitButton" value="User Registration" />
            </div>
        </fieldset>
    </g:form>
</div>