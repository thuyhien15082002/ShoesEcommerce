package com.shoesecom.Service.ImpService;

import com.shoesecom.DAO.IImageDAO;
import com.shoesecom.Model.Image;
import com.shoesecom.Service.IImageService;

import javax.inject.Inject;
import java.util.List;

public class ImageService implements IImageService {
    @Inject
    private IImageDAO imageDAO;
    @Override
    public List<Image> getAllImage() {
        return imageDAO.getAllImage();
    }

    @Override
    public Image getImageById(int id) {
        return imageDAO.getImageById(id);
    }

    @Override
    public Image getImageByProductId(int productId) {
        return imageDAO.getImageByProductId(productId);
    }

    @Override
    public void addImage(Image image) {
        imageDAO.addImage(image);
    }

    @Override
    public void editImage(Image image) {
        imageDAO.editImage(image);
    }

    @Override
    public void deleteImage(int id) {
        imageDAO.deleteImage(id);
    }
}
