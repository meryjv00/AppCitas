/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Auxiliar;

import java.io.FileWriter;
import java.io.IOException;

/**
 *
 * @author Mery
 */
public class Bitacora {
        public static void escribirBitacora(String m) {
        FileWriter fw = null;
        System.out.println(m);
        try {
            fw = new FileWriter(Constantes.ficheroBitacora, true);
            fw.write(m+"\r\n");
            fw.close();
        } catch (IOException ex) {
            System.out.println(ex.getMessage());
        }
    }
}
