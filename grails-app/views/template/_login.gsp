<div class="inner-co1ntainer">
<g:if test="${session["user"]}">
    </br>
 Login as : ${session["user"]}  | <g:link action="logout">Logout</g:link>
</g:if>
<g:else>
    <g:form controller="login" action="loginHandler">
        <div class="line">
            <lable for="email">Email:&nbsp;&nbsp;</lable>
            <input type="email" id="email" name="email"/>
        </div>
        <div class="line">
            <lable for="password">Password*:&nbsp;&nbsp;</lable>
            <input type="password" id="password" name="password"/>
        </div>
        <div class="line">
            <lable for="login"></lable>
            <input type="submit" value ='Login' id="login"/>
        </div>
        <div class="line">
            <a href="" target="_blank">Forgot password</a>
        </div>
    </g:form>
</g:else>
</div>