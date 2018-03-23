package com.robin.temp;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class Main {
	public static void main(String[] args) throws IOException {
		System.out.printf("Free disk space: %dM\n", Files.getFileStore(Paths.get(args[0])).getUsableSpace() / (1024 * 1024));
		
	}
}
