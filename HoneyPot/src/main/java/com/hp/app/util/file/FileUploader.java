package com.hp.app.util.file;

import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.Part;

import org.springframework.web.multipart.MultipartFile;

public class FileUploader {
	public static List<String> saveFile(String path, List<MultipartFile> fList) throws Exception {
		List<String> list = new ArrayList<>();
		for (MultipartFile f : fList) {
			list.add(saveFile(path, f));
		}
		return list;
	}

	public static String saveFile(String path, MultipartFile file) throws Exception {
		String randomName = UUID.randomUUID().toString();
		String originName = file.getOriginalFilename();
		String ext = originName.substring(originName.lastIndexOf("."));
		String changeName = randomName + ext;
		File target = new File(path + changeName);

		try (FileOutputStream fos = new FileOutputStream(target); InputStream is = file.getInputStream();) {
			byte[] buf = new byte[1024];
			int size = 0;
			while ((size = is.read(buf)) != -1) {
				fos.write(buf, 0, size);
			}
		}
		return changeName;
	}

}