package Util;

import java.io.*;
import java.net.*;
import java.util.*;
import java.util.concurrent.ArrayBlockingQueue;

public class ChatRoom {

	private ArrayBlockingQueue<ServerThread> serverThreads; // List<ServerThread>

	public static void main(String [] args)
	{
		new ChatRoom(6789);
	}

	public ChatRoom(int port)
	{
		try
		{
			System.out.println("Binding to port " + port);
			ServerSocket ss = new ServerSocket(port);
			serverThreads = new ArrayBlockingQueue<ServerThread>(5); // new ArrayList<>();
			while(true)
			{
				Socket s = ss.accept();   //  Accept the incoming request
				System.out.println("Connection from " + s + " at " + new Date());
				ServerThread st = new ServerThread(s, this); //connection handler
				System.out.println("Adding this client to active client list");
				serverThreads.add(st);
			}
		}
		catch (Exception ex) {
			System.out.println("Server shut down unexpectedly.");
			return;
		}

	}

	public void broadcast(String message)
	{
		if (message != null) {
			System.out.println("broadcasting ..." + message);
			for(ServerThread threads : serverThreads)
					threads.sendMessage(message);
		}
	}

}