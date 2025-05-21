using System;
using System.Runtime.InteropServices;
using System.Windows.Forms;
using WindowsInput;
using WindowsInput.Native;

namespace NullMovementScript
{
    class Program
    {
        [DllImport("user32.dll")]
        public static extern short GetAsyncKeyState(Keys vKey);

        static bool a_held = false;  // Estado real da tecla 'a'
        static bool d_held = false;  // Estado real da tecla 'd'
        static bool a_scrip = false; // Estado simulado da tecla 'a'
        static bool d_scrip = false; // Estado simulado da tecla 'd'

        static DateTime lastUpdate = DateTime.Now; // Armazena o tempo da última atualização
        static Random rand = new Random(); // Gerador de números aleatórios para variação no timing

        static void Main(string[] args)
        {
            var sim = new InputSimulator(); // Inicializa o simulador de entrada

            Console.WriteLine("Pressione ESC para fechar");

            while (true)
            {
                if (Convert.ToBoolean(GetAsyncKeyState(Keys.Escape) & 0x8000))
                {
                    // Se ESC for pressionado, encerre o programa
                    break;
                }

                bool a_pressed = Convert.ToBoolean(GetAsyncKeyState(Keys.A) & 0x8000); // Verifica se 'a' está pressionada
                bool d_pressed = Convert.ToBoolean(GetAsyncKeyState(Keys.D) & 0x8000); // Verifica se 'd' está pressionada

                // Prioriza a última tecla pressionada
                if (a_pressed && !a_held)
                {
                    a_held = true;
                    if (d_scrip)
                    {
                        d_scrip = false;
                        sim.Keyboard.KeyUp(VirtualKeyCode.VK_D);
                    }
                    if (!a_scrip)
                    {
                        a_scrip = true;
                        sim.Keyboard.KeyDown(VirtualKeyCode.VK_A);
                    }
                }
                else if (!a_pressed && a_held)
                {
                    a_held = false;
                    if (a_scrip)
                    {
                        a_scrip = false;
                        sim.Keyboard.KeyUp(VirtualKeyCode.VK_A);
                    }
                    if (d_held && !d_scrip)
                    {
                        d_scrip = true;
                        sim.Keyboard.KeyDown(VirtualKeyCode.VK_D);
                    }
                }

                if (d_pressed && !d_held)
                {
                    d_held = true;
                    if (a_scrip)
                    {
                        a_scrip = false;
                        sim.Keyboard.KeyUp(VirtualKeyCode.VK_A);
                    }
                    if (!d_scrip)
                    {
                        d_scrip = true;
                        sim.Keyboard.KeyDown(VirtualKeyCode.VK_D);
                    }
                }
                else if (!d_pressed && d_held)
                {
                    d_held = false;
                    if (d_scrip)
                    {
                        d_scrip = false;
                        sim.Keyboard.KeyUp(VirtualKeyCode.VK_D);
                    }
                    if (a_held && !a_scrip)
                    {
                        a_scrip = true;
                        sim.Keyboard.KeyDown(VirtualKeyCode.VK_A);
                    }
                }

                // Pequeno delay para evitar uso excessivo da CPU, com variação para evitar detecção
                System.Threading.Thread.Sleep(1 + rand.Next(0, 2));

                // Adiciona um tempo mínimo entre as trocas de teclas para melhorar a responsividade
                if ((DateTime.Now - lastUpdate).TotalMilliseconds >= 1)
                {
                    lastUpdate = DateTime.Now; // Atualiza o tempo da última atualização
                }
            }

            Console.WriteLine("Programa encerrado.");
        }
    }
}
