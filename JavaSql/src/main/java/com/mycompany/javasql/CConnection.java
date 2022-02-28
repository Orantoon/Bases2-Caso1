package com.mycompany.javasql;

import java.sql.Connection;
import java.sql.DriverManager;
import javax.swing.JOptionPane;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 

/**
 *
 * @author david
 */
public class CConnection {
    
    Connection connect = null;
    
    String user = "usersql";
    String password = "root";
    String db = "bases2_caso1";
    String ip = "localhost\\DEIBID";
    String port = "1433";
    
    String chain = "jdbc:sqlserver://"+ip+":"+port+"/"+db;
    // "jdbc:sqlserver://"+ip+":"+port+";"+"databaseName="+db;
    
    public Connection startConnection(){
        try{
            String chain = "jdbc:sqlserver://"+ip+":"+port+";databaseName="+db;
            connect = DriverManager.getConnection(chain,user,password);

            JOptionPane.showMessageDialog(null, "Se ha conectado correctamente");
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error al conectarse con la base de datos. Error: "+ e.toString());
        }
        return connect;
    }
}
