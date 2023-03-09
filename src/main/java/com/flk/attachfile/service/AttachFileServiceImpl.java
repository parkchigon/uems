package com.flk.attachfile.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.flk.attachfile.domain.AttachFile;
import com.flk.attachfile.mapper.AttachFileMapper;
import com.flk.common.dataaccess.util.FlkMap;

import egovframework.rte.fdl.idgnr.EgovIdGnrService;


/**
 * 
 * 파일 첨부 서비스
 *
 */
@Service("attachFileService")
public class AttachFileServiceImpl implements AttachFileService {
	
	@Resource(name = "attachFileMapper")
	private AttachFileMapper attachFileMapper;

	@Resource(name = "fileIdGnrService")
	private EgovIdGnrService egovIdGnrService;

	@Override
	public void removeAttachFile(AttachFile attachFile) throws Exception {
		attachFileMapper.deleteAttachFile(attachFile);
	}

	@Override
	public void removeAttachFileFileRefId(String fileRefId, String fileGroup) throws Exception {
		AttachFile attachFile = new AttachFile();
		attachFile.setFileReferenceId(fileRefId);
		attachFile.setFileGroup(fileGroup);
		attachFileMapper.updateAttachFileFileRefId(attachFile);
	}

	@Override
	public void addAttachFile(AttachFile attachFile) throws Exception {
		attachFileMapper.insertAttachFile(attachFile);
	}

	@Override
	public void attachFileExe(String fileRefId, String[] fileids) throws Exception {
		if (fileids != null) {
			AttachFile attachFileVO = new AttachFile();
			attachFileVO.setFileReferenceId(fileRefId);
			for (int i = 0; i < fileids.length; i++) {
				String exeType = fileids[i].split("[*]")[0];
				attachFileVO.setFileId(fileids[i].split("[*]")[1]);
				
				/** 대표이미지 표시 여부 */
				attachFileVO.setDelegateYn((fileids[i].split("[*]")[2]));
				
				if (exeType.equals("reg")) {
					modifyAttachFile(attachFileVO);
				} else if (exeType.equals("del")) {
					removeAttachFile(attachFileVO);
				}
			}
		}
	}


	/****
	 * IMAGE 아래가 본래 기능 위 메소는 상품상세 대표 이미지 기능으로 추가됨
	 */
	@Override
	public void modifyAttachFileImageExe(String fileRefId, String[] fileids) throws Exception {
		if (fileids == null || fileids.length == 0) {
			return;
		}
		AttachFile attachFileVO = new AttachFile();
		attachFileVO.setFileReferenceId(fileRefId);
		for (int i = 0; i < fileids.length; i++) {
			String exeType = fileids[i].split("[*]")[0];
			attachFileVO.setFileId(fileids[i].split("[*]")[1]);
			// 게시판 > 대표이미지 없음 
			attachFileVO.setDelegateYn("N");
			
			if (exeType.equals("reg")) {
				modifyAttachFile(attachFileVO);
			} else if (exeType.equals("del")) {
				removeAttachFile(attachFileVO);
			}
		}
	}
	
	@Override
	public List<FlkMap> searchAttachFileList(AttachFile attachFile) throws Exception {
		return attachFileMapper.selectAttachFileList(attachFile);
	}

	@Override
	public void modifyAttachFile(AttachFile attachFile) throws Exception {
		attachFileMapper.updateAttachFile(attachFile);
	}

	@Override
	public FlkMap searchAttachFileView(AttachFile attachFile) throws Exception {
		return attachFileMapper.selectAttachFileView(attachFile);
	}

	@Override
	public void modifyAttachFileDownCnt(AttachFile attachFile) throws Exception {
		attachFileMapper.updateAttachFileDownCnt(attachFile);
	}

	@Override
	@Transactional
	public void addAttachFileCopy(String oldFileRefId, String newFileRefId, String regId) throws Exception {
		
		AttachFile oldFile = new AttachFile();
		oldFile.setFileReferenceId(oldFileRefId);
		
		List<FlkMap> oldFiles = attachFileMapper.selectAttachFileList(oldFile);
		
		for ( FlkMap obj : oldFiles ) {
			AttachFile vo = new AttachFile();
			vo.setOldFileId(obj.get("fileId").toString());
			vo.setFileId(egovIdGnrService.getNextStringId());
			vo.setRegId(regId);
			vo.setFileReferenceId(newFileRefId);
			
			attachFileMapper.insertAttachFileCopy(vo);
		}
	}
	
}
