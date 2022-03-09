## GeoEco Desarrollo Bussines Central

Se trata de un proyecto con el lenguaje de programación C/Al o Al usado para el ERP de Microsoft Busines Central (antiguo Navision), en el cual se va a desarrollar una funcionalidad anexa al core del estandar, por medio de extensiones y creación de diversos objetos, Table Extension, Page Extension, Tables, Pages, CodeUnits y Reports se va a obtener una funcionalidad distinta ya que nos va a permitir crear y automatizar los procesos de suscripción. 

Tenemos un canal en YouTube: Queremos poder agregar clientes que se hayan suscrito a nuestro canal y poder administrarles via ERP, unass ofertas,pedidos, facturas y que estas facturas les lleguen via e-mail. Y a nosotros que podamos administrarlas, es decir que podamos realizar ofertas, pedidos facturas y ponerle un plan de pagos de manera rápida gracias a nuestro ERP. Para ello se han utilizado diversos controles y reports automáticos que facilitan todo el proceso.

Queda pendiente (To Do):

  •	Página part list (Ej facturas página card + página de líneas(lista) usar tabla temporal (ver funcionamiento)
  Crear una ficha de suscriptor que contenga como histórico una lista  con los campos de grupo precio cliente + tiempo.

  •	Correo + Blob-stream pdf import – export adjuntar correo (adjunto):
  Enviar oferta de suscripción por correo electrónico adjuntando el pdf de la oferta (exportar campo Blob), otro pdf previamente guardado en el sistema (importar campo blob), con varios destinatarios, y pudiendo editar el mensaje antes de mandar el correo. (modelo de Italpannelli). Carpetas donde poner los pdfs.

  •	Excel import export:
  Crear 1-2 productos de Merchandising, importar un Excel con “Producto”, “Cantidad”, “Coste”, “Proveedor”  generar pedidos de compra con los datos de ese Excel y registrarlos.  Facturar automáticamente y exportar un Excel con las facturas de compra generadas. 

  •	Txt import export: Importar un txt para actualizar la categoría de suscriptor de los clientes, exportar un txt con los clientes modificados. 

  •	Probar en SandBox o versión de pruebas si no funciona el correo o los pdfs
