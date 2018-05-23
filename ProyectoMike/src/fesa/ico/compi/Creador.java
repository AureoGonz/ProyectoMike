/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fesa.ico.compi;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Benjiman
 */
public class Creador {

    public static void main(String[] args) {
        String ruta = System.getProperty("user.dir") + "/src/fesa/ico/compi/";
        String[] asintactico = {
            "-parser", "SintacticoSQL", ruta + "Grama.cup"};
        Creador app = new Creador();
        app.crearLex(ruta + "Reglas.jflex");
        try {
            java_cup.Main.main(asintactico);
            app.moverCUP(asintactico[1] + ".java", ruta);
            app.moverCUP("sym.java", ruta);
        } catch (IOException ex) {
            Logger.getLogger(
                    Creador.class.getName()).log(Level.SEVERE, null, ex);
        } catch (Exception ex) {
            Logger.getLogger(
                    Creador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void crearLex(String ruta) {
        File f = new File(ruta);
        jflex.Main.generate(f);
    }

    private void moverCUP(String nombreArch, String ruta) {
        try {
            Path temp = Files.move(Paths.get("" + nombreArch),
                    Paths.get(ruta + nombreArch));
        } catch (IOException ex) {
            Logger.getLogger(
                    Creador.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
