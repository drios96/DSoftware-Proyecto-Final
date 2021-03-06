package controller;

import EmpresaLineaBlanca.Main;
import javafx.event.ActionEvent;
import javafx.fxml.FXML;
import javafx.fxml.FXMLLoader;
import javafx.scene.Parent;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.stage.Modality;
import javafx.stage.Stage;

import java.io.IOException;

public class SuperAdminController {

    @FXML
    private Button btnConsultas;
    @FXML
    private Button btnLogout;
    @FXML
    private Button btnUsuario;


    @FXML

    private void handleButtonClicks(javafx.event.ActionEvent mouseEvent) {

        if (mouseEvent.getSource() == btnUsuario) {

            loadStage("/application/AgregarUsuario.fxml");

        } else if (mouseEvent.getSource() == btnConsultas) {

            loadStage("/application/ConsultarElemento.fxml");

        } else if (mouseEvent.getSource() == btnLogout) {

            cerrarSesion(mouseEvent);

        }

    }

    private void loadStage(String fxml) {

        try {

            Parent root = FXMLLoader.load(getClass().getResource(fxml));

            Stage stage = new Stage();

            stage.setScene(new Scene(root));

            stage.initModality(Modality.APPLICATION_MODAL);

            stage.show();

        } catch (IOException e) {

            e.printStackTrace();

        }

    }

    @FXML

    private void cerrarSesion(ActionEvent event) {

        try{

            Main.logout();

        }catch(Exception e){

            e.printStackTrace();

        }

    }

}
