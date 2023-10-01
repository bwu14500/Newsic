package Util;

import java.io.*;
import java.net.Socket;
import java.util.concurrent.*;

public class ServerThread extends Thread {
	
	private static Semaphore semaphore = new Semaphore(5);

	private PrintWriter pw;
	private BufferedReader br;
	private ChatRoom cr;
	private Socket s;

	public ServerThread(Socket s, ChatRoom cr)
	{
		this.s = s;
		this.cr = cr;
		try
		{
			pw = new PrintWriter(s.getOutputStream(), true);
			br = new BufferedReader(new InputStreamReader(s.getInputStream()));
			start();
		}
		catch (IOException ex) {ex.printStackTrace();}
	}

	public void sendMessage(String message)
	{
		pw.println(message);
	}

	public void run()
	{
		try {
			semaphore.acquire();
			while(true)
			{
				String line = br.readLine();
				//if(line == null) break; // client quits
				cr.broadcast(line);   // Send text back to the clients
			}
		}
		catch (Exception ex) {ex.printStackTrace();}
		finally {
			try {
				pw.close();
				br.close();
				s.close();
				semaphore.release();
			}
			catch (Exception ex) {ex.printStackTrace();}
		}//finally
		
		
	}//run
}
