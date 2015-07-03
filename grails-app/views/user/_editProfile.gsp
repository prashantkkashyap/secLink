<div class="inner-container">
    <g:uploadForm controller="user" action="updateUserProfile" enctype="multipart/form-data">
        <fieldset>
            <div class="line">
                <label for="firstName">First Name: </label>
                <g:textField name="firstName" id="firstName" />

            </div>
            <div class="line">
                <label for="lastName">Last Name: </label>
                <g:textField name="lastName" id="lastName"/>

            </div>
             <div class="line">
                 <label for="userName"> Username*: </label>
                 <input type="text" name="userName" id="userName"/>
             </div>
                <div class="line"><label for="image">Photo</label>
                <input type="file" id="image" name="image">
            </div>
            <div class="line">
                <g:submitButton name="submitButton" value="Update" />
            </div>
         </fieldset>
    </g:uploadForm>
</div>
