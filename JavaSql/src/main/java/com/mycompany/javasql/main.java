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
 */

/**
 *
 * @author david
 */
public class main {
    public static void main(String[] args){
        CConnection connection = new CConnection();
        //connection.startConnection();
        
        connection.query1();
        connection.query2();
        connection.query3();
    }
}
