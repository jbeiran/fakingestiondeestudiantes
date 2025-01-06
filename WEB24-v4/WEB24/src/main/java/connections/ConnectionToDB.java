/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package connections;

import java.sql.Connection;
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

    public ConnectionToDB() {
        try {
            Class.forName("org.sqlite.JDBC");
            var config = new HikariConfig();
            var resourceUrl = getClass().getClassLoader().getResource("bd/aed.db");
            if (resourceUrl == null)
                throw new IllegalArgumentException("No se pudo encontrar el archivo 'aed.db' en el classpath.");

            config.setJdbcUrl("jdbc:sqlite:" + resourceUrl.getPath());
            config.setDriverClassName("org.sqlite.JDBC");

            // Configuración específica para SQLite
            config.setMaximumPoolSize(1); // Crucial: mantener solo una conexión
            config.setConnectionTimeout(30000);
            config.setAutoCommit(false); // Importante para control de transacciones

            // Propiedades SQLite específicas
            config.addDataSourceProperty("journal_mode", "WAL"); // Write-Ahead Logging
            config.addDataSourceProperty("synchronous", "NORMAL");
            config.addDataSourceProperty("busy_timeout", "30000");

            this.dataSource = new HikariDataSource(config);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConnectionToDB.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public Connection getConnection() {
        Connection con = null;
        try {
            con = this.dataSource.getConnection();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return con;
    }

}
