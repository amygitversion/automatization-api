package utils;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

public class CsvWriterUtils {

    public static void appendLine(String path, String headers, String line) {
        try {
            File file = new File(path);
            boolean isNewFile = file.createNewFile(); // crea si no existe
            try (FileWriter fw = new FileWriter(file, true)) { // true = modo append
                // Si es un nuevo archivo, escribe el encabezado
                if (isNewFile) {
                    fw.write(headers);
                }
                fw.write(line);
            }
        } catch (IOException e) {
            throw new RuntimeException("Error al escribir el CSV: " + e.getMessage(), e);
        }
    }
}