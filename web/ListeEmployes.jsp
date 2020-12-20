<%-- 
    Document   : ListeEmployes
    Created on : 20 déc. 2020, 20:14:39
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TP BD</title>
    </head>
    <style>
    body {background-color: #F4F1DE;}
    h1{text-align: center;}
    tr{text-align: center;}
    </style>
        <h1 ><i>Affichage des employes </i> </h1>
        <%@page import ="java.sql.*" %>
     
        <table width="100%" border="2" >
            <tr>
                <th width="25%" bgcolor="#F4F1DE"> Matricule </th>
                <th width="25%" bgcolor="#81B29A"> Nom </th>
                <th width="25%" bgcolor="#F4F1DE"> Prenom </th>
                <th width="25%" bgcolor="#81B29A"> Service </th>
            </tr>
            <%
                try {
                    Class.forName("org.apache.derby.jdbc.ClientDriver").newInstance();
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/Etablissement", "root","root");
                    Statement stmt = conn.createStatement();
                    String sql = "select * from employee";
                    ResultSet rs = stmt.executeQuery(sql);
                    while( rs.next()){%>
                    <tr>
                        <td bgcolor="grey">
                         <%= rs.getString("Matricule")%>
                        </td>
                         <td>
                         <%= rs.getString("Nom")%>
                        </td>
                         <td bgcolor="grey">
                         <%= rs.getString("Prenom")%>
                        </td>
                         <td>
                             <%= rs.getString("Service")%>
                         </td> 
                    </tr>
                    
                <%}%>
        </table>
                   <% if( stmt != null) {
                       stmt.close();    
                   } 
                   if( conn != null) {
                       conn.close();    
                   }
                }
catch ( Exception e){
out.print(e);
}
                    %>
            
        </table>
    </body>
</html>
