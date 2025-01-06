/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connections;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
//LIBRERIAS PARA LA GESTION DEL POOL DE CONEXIONES:
import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;  

/**
 *
 * @author Flavio
 */
public class ConnectionToDB {
    
    private HikariDataSource dataSource;
    
    public ConnectionToDB(){
        try{
            Class.forName("org.sqlite.JDBC");
            var config =  new HikariConfig();   //Configuracion de Hikari para gestionar el Pool de conexiones
            var resourceUrl = getClass().getClassLoader().getResource("bd/aed.db");    //obtencion de los recursos de la BD local
            if (resourceUrl == null) throw new IllegalArgumentException("No se pudo encontrar el archivo 'aed.db' en el classpath.");
             config.setJdbcUrl("jdbc:sqlite:" + resourceUrl.getPath());
            config.setDriverClassName("org.sqlite.JDBC");

            // Configuración optimizada para SQLite
            config.setMaximumPoolSize(1); // Importante: limitar a 1 para SQLite
            config.setConnectionTimeout(30000);
            config.addDataSourceProperty("journal_mode", "WAL"); // Write-Ahead Logging
            config.addDataSourceProperty("synchronous", "NORMAL");

            // Inicializar el datasource
            this.dataSource = new HikariDataSource(config);

            System.out.println("Pool de conexiones inicializado exitosamente.");
            
            //this.con.close();
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Connection getConnection() {
        Connection con = null;
        try{
            con = this.dataSource.getConnection();
        }catch(SQLException e){
            e.printStackTrace();
        }
        return con;
    }

}
