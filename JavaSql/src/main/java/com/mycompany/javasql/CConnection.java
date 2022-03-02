package com.mycompany.javasql;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
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
    
    public Connection startConnection(){
        try{
            String chain = "jdbc:sqlserver://"+ip+":"+port+";databaseName="+db;
            connect = DriverManager.getConnection(chain,user,password);
            
            //JOptionPane.showMessageDialog(null, "Se ha conectado correctamente");
            
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error al conectarse con la base de datos. Error: "+ e.toString());
        }
        return connect;
    }
    
    public void query1(){
        String bases = "";
        
        try{
            Statement sql = startConnection().createStatement();
            String consulta = "EXEC bases2_caso1.dbo.Query1 @canton = 7";
            ResultSet resultado = sql.executeQuery(consulta);
            
            while(resultado.next()){
                bases += resultado.getString(2) + "\n"; //entregableId
            }
            
            JOptionPane.showMessageDialog(null, bases);
            
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error: "+ e.toString());
        }
    }
    
    public void query2(){
        String bases = "";
        
        try{
            Statement sql = startConnection().createStatement();
            String consulta = "EXEC bases2_caso1.dbo.Query2";
            ResultSet resultado = sql.executeQuery(consulta);
            
            while(resultado.next()){
                bases += resultado.getString(1) + "\n";
            }
            
            JOptionPane.showMessageDialog(null, bases);
            
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error: "+ e.toString());
        }
    }
    
    public void query3(){
        String bases = "";
        
        try{
            Statement sql = startConnection().createStatement();
            String consulta = "EXEC bases2_caso1.dbo.Query3";
            ResultSet resultado = sql.executeQuery(consulta);
            
            while(resultado.next()){
                bases += resultado.getString(1) + "\n";
            }
            
            JOptionPane.showMessageDialog(null, bases);
            
        } catch (Exception e){
            JOptionPane.showMessageDialog(null, "Error: "+ e.toString());
        }
    }
}
