*Ejercicio 11. (2 horas)
*El cliente solicita tener un reporte donde pueda ver los todos los pedidos que tienen sus clientes y poder a
*su vez visualizar cuales est�n pendientes de entrega.
*Para ello se necesita crear un reporte ALV GRID cuya pantalla de selecci�n contenga:
* Select option: S_KUNNR (obligatorio)
* Radio button: RB_ENTREGADO (cuya descripci�n ser� �Entregado� y �Pendiente de entrega�
*
** Acceder a la tabla Z_CLIENTES_APELLIDOALUMNO (donde APELLIDOALUMNO sea el apellido del
*alumno que desarrolla el ejercicio y que fue creada con anterioridad) con kunnr igual a S_KUNNR y
*recuperar:
*Kunnr (cliente)
*Raz�n (raz�n social)
** Con los resultados obtenidos(si se obtuvieron) acceder a la tabla Z_PEDIDOS_APELLIDOALUMNO
*(donde APELLIDOALUMNO sea el apellido del alumno que desarrolla el ejercicio y que fue creada con
*anterioridad) con:
*KUNNR = Z_CLIENTES_APELLIDOALUMNO-KUNNR
*ENTREGADO = (X o espacio seg�n el radio button que se haya elegido en la pantalla de selecci�n.)
*Y recuperar:
*Kunnr (Cliente)
*Pedido (Pedido)
*Direccion (Direcci�n de entrega)
*Entregado (Entregado)
*
*Ordenar ambas tablas. La tabla Z_CLIENTES_APELLIDOALUMNO por cliente (kunnr), mientras que la
*tabla Z_PEDIDOS_ APELLIDOALUMNO se debe ordenar por cliente y pedido (kunnr, pedido). Se berer� ir
*llenando una tabla interna I_ALV que contendr� los datos a mostrar. La tabla interna tendr� los
*siguientes campos:
*I_ALV :
* KUNNR (cliente)
* Raz�n (raz�n social)
* Pedido (Pedido)
* Direccion (Direcci�n de entrega)
* Entregado (Entregado)
*
*Recorrer la tabla Z_CLIENTES_APELLIDOALUMNO:
** Llenar los campos KUNNR y RAZON de una estructura llamada R_ALV
**Recorrer la tabla Z_PEDIDOS_APELLIDOALUMNO donde kunnr =
*Z_CLIENTES_APELLIDOALUMNO-KUNNR
*Llenar los campos PEDIDO , DIRECCION y ENTREGADO de la estructura R_ALV
**Antes de pasar a la siguiente iteraci�n del loop se debe apendear R_ALV a la tabla interna
*I_ALV
*Mostrar la tabla I_ALV con un ALV GRID ordenado por kunnr y pedido.


*&---------------------------------------------------------------------*
*& Report  Z_EJ11_ANTO
*&---------------------------------------------------------------------*
REPORT  z_ej11_anto.
*&---------------------------------------------------------------------*
*& INCLUDES
*&---------------------------------------------------------------------*

INCLUDE z_ej11_anto_top.
INCLUDE z_ej11_anto_selections.
INCLUDE z_ej11_anto_forms.

*&---------------------------------------------------------------------*
*& START OF SELECTION : ES UN EVENTO
*&---------------------------------------------------------------------*

START-OF-SELECTION.

*&---------------------------------------------------------------------*
*& RADIO BUTTON - HACER QUE SELECCIONE LA X EN LA POSICION CORRECTA
*&---------------------------------------------------------------------*

  IF rb1_entr EQ 'X'.
    v_cruz = 'X'.
  ELSE.
    v_cruz = ' '.
  ENDIF.

*&---------------------------------------------------------------------*
*& PERFORMS
*&---------------------------------------------------------------------*

  PERFORM f_selects.
  PERFORM f_completar_tablita.
  PERFORM f_config_fieldcats.
  PERFORM f_mostrar_alv.

  END-OF-SELECTION.
