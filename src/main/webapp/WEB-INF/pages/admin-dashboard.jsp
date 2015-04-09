<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="bodycontent">
  <h2>Admin Dashboard</h2>

  <button type="button" onclick="location.href='/admin/add'" class="btn btn-primary">Add New Election</button><br/><br/>
  <div class="panel panel-default">
    <div class="panel-heading"><h3 class="panel-title">Elections</h3></div>
    <div class="panel-body">
      <table class="table">
        <thead>
          <tr>
            <th>#</th>
            <th>Name</th>
            <th>Choice 1</th>
            <th>Choice 2</th>
            <th>Total Votes</th>
            <th></th>
          </tr>
        </thead>
        <tbody>
        <c:forEach items="${elections}" var="election">
          <tr>
            <td><c:out value="${election['election_id']}"/></td>
            <td><c:out value="${election['election_name']}"/></td>
            <td><c:out value="${election['election_choice1']}"/> (<c:out value="${election['election_votes1']}"/>)</td>
            <td><c:out value="${election['election_choice2']}"/> (<c:out value="${election['election_votes2']}"/>)</td>
            <td><c:out value="${election['election_totalvotes']}"/></td>
            <td>
              <a href="/admin/delete/<c:out value="${election['election_id']}"/>" onclick="return confirm('Are you sure you want to delete?');">
                <span class="glyphicon glyphicon-remove-circle" aria-hidden="true"></span>
              </a>
            </td>
          </tr>
        </c:forEach>
        </tbody>

      </table>
    </div>
  </div>

</div>