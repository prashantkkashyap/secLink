<g:each in="${topPost}" var="post">
    <ul>
        <li>${post.createdBy.firstName}</li>
        <li><g:link action="">${post.topic}</g:link></li>
        <li><g:link action="">View Post</g:link></li>
    </ul>
    <ul>
        <li>${post.description}</li>
    </ul>
</g:each>



