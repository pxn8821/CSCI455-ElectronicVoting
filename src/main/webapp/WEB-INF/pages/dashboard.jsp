<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<div id="bodycontent">
  <h2>Dashboard</h2>
  <c:if test="${message eq 'error'}">
    <div class="alert alert-danger" role="alert">An error has occurred! Your vote has NOT been cast. Please try again!</div>
  </c:if>
  <c:if test="${message eq 'success'}">
    <div class="alert alert-success" role="alert">Your vote has been cast!</div>
  </c:if>

  <div class="panel panel-default">
    <div class="panel-heading"><h3 class="panel-title">Elections To Vote</h3></div>
    <div class="panel-body">
      <table class="table">
        <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Choice 1</th>
          <th>Choice 2</th>
          <th>Total Votes</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${novoteElections}" var="election">
          <tr>
            <td><c:out value="${election['election_id']}"/></td>
            <td><c:out value="${election['election_name']}"/></td>
            <td><a href="/user/castvote/<c:out value="${election['election_id']}"/>/1"><c:out value="${election['election_choice1']}"/></a></td>
            <td><a href="/user/castvote/<c:out value="${election['election_id']}"/>/2"><c:out value="${election['election_choice2']}"/></a></td>
            <td><c:out value="${election['election_totalvotes']}"/></td>

          </tr>
        </c:forEach>
        </tbody>

      </table>
    </div>
  </div>

  <div class="panel panel-default">
    <div class="panel-heading">
      <h3 class="panel-title">Elections I Have Voted</h3>
    </div>
    <div class="panel-body">
      <table class="table">
        <thead>
        <tr>
          <th>#</th>
          <th>Name</th>
          <th>Choice 1</th>
          <th>Choice 2</th>
          <th>Total Votes</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${votedElections}" var="election">
          <tr>
            <td><c:out value="${election['election_id']}"/></td>
            <td><c:out value="${election['election_name']}"/></td>
            <td><c:out value="${election['election_choice1']}"/> (<c:out value="${election['election_votes1']}"/>)</td>
            <td><c:out value="${election['election_choice2']}"/> (<c:out value="${election['election_votes2']}"/>)</td>
            <td><c:out value="${election['election_totalvotes']}"/></td>

          </tr>
        </c:forEach>
        </tbody>

      </table>
    </div>
  </div>

</div>