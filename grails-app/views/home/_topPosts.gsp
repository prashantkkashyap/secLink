<g:each in="${topPost}" var="post">
    <ul>
        <li>${post.createdBy.firstName}</li>
        <li><g:link >${post.topic.name}</g:link></li>
        <li>${post.dateCreated}     </li>

    </ul>
    <ul>
        <li>${post.description}</li>
    </ul>
    <ul>
        <li><g:link controller="resource" action="viewPost" id="${post.id}">View Post</g:link></li>
    </ul>
</g:each>



