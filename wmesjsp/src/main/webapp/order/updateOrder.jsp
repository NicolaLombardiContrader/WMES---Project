<%@ include file="/header.jsp"%>
<%
	//modifica
	List<ClientDTO> allClientsByUser = (List<ClientDTO>) request.getAttribute("clientsByUser");
%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/wmesjsp/css/style.css">
<style>
/*contenitore in cima dove c'� scritto "Login"*/
.pre_contenitore {
	width: 320px;
	margin: auto;
	height: 50px;
	border: 1px solid black;
	border-radius: 40px 40px 40px 40px;
	background-color: rgba(0, 0, 0, 0.9);
	box-shadow: 20px 30px 20px #000000;
	padding: 20px;
}

.pre_contenitore p {
	color: white;
	text-align: center;
	font-size: 1.9em;
	font-family: arial;
	line-height: 2px;
}
</style>

<%
	OrderDTO updateOrder = (OrderDTO) request.getAttribute("orderUpdate");
%>
</head>

<body>
	<div class="center">



		<div class="pre_contenitore">

			<p>Modifica Ordine</p>

		</div>
		<br> <br>
		<form method="POST" action="/wmesjsp/OrderServlet?richiesta=update">

			<input type="hidden" name="order_id" value="<%=updateOrder.getId()%>" /><br>

			Client Name:
			 <select name="client_id">
			<%
				for (ClientDTO clientDTO : allClientsByUser) {
					if (clientDTO.getId() == updateOrder.getClientDTO().getId()) {
			%>

			<option selected="selected" value="<%=clientDTO.getId()%>"><%=clientDTO.getClientName()%></option>

			<%
				} else {
			%>

			<option value="<%=clientDTO.getId()%>"><%=clientDTO.getClientName()%></option>

			<%
				} //end if
				} //end for
			%>
			</select>
			<br>
			<br>

			Description: <input type="text" size="40" maxlength="40"
				name="order_description" value="<%=updateOrder.getDescription()%>" /><br>
			<br> <input type="SUBMIT" value="Modifica"> <br /> <br />
			<a href="/wmesjsp/OrderServlet?richiesta=indietro"><span
				class="fs">Indietro</span></a>

		</form>

	</div>
</body>
</html>