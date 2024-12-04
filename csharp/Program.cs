using System;
using System.Windows.Forms;

namespace HelloWorldGui
{
    class Program
    {
        [STAThread]
        static void Main()
        {
            Application.EnableVisualStyles();
            Application.SetCompatibleTextRenderingDefault(false);

            // Crea una nueva ventana
            Form form = new Form();
            form.Text = "Hola Mundo";

            // Crea un control Label y configúralo
            Label label = new Label();
            label.Text = "¡Hola Mundo!";
            label.Dock = DockStyle.Fill;
            label.TextAlign = ContentAlignment.MiddleCenter;

            // Agrega el control Label a la ventana
            form.Controls.Add(label);

            // Ejecuta la aplicación
            Application.Run(form);
        }
    }
}

