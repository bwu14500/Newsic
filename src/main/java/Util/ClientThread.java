package Util;

import java.io.*;
import java.net.*;
import java.util.*;

public class ClientThread extends Thread
{
	private BufferedReader br;
	private PrintWriter pw;
	private String name;
	private Socket s;
	private Scanner scan;
	private boolean posted;
	private boolean logout = false;
	private boolean sessionEnds = false;

	public ClientThread(String hostname, int port)
	{
		try
		{
			s = new Socket(hostname, port);
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			pw = new PrintWriter(s.getOutputStream(), true);
			start();
			do
			{
				if (posted) {
					pw.println(name +" posted");
				}

			} while(!logout); //
			sessionEnds = true;
		}
		catch (IOException ex) {ex.printStackTrace();}
	}

	public void run()
	{
		try
		{
			while(true)
			{
				String line = br.readLine();
				System.out.println(line);
				if (sessionEnds) break;
			}
		}
		catch (IOException ex) {ex.printStackTrace();}
		finally
		{
			try {
				pw.close();
				br.close();
				s.close();
			} catch (IOException ex) {ex.printStackTrace();}
		}
	}

	public static void main(String [] args)
	{
		new ClientThread("localhost", 6789);
	}
}

