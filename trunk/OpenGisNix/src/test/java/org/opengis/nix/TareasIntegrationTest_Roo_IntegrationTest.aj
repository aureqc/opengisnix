// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package org.opengis.nix;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.opengis.nix.TareaDataOnDemand;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

privileged aspect TareasIntegrationTest_Roo_IntegrationTest {
    
    declare @type: TareasIntegrationTest: @RunWith(SpringJUnit4ClassRunner.class);
    
    declare @type: TareasIntegrationTest: @ContextConfiguration(locations = "classpath:/META-INF/spring/applicationContext.xml");
    
    declare @type: TareasIntegrationTest: @Transactional;
    
    @Autowired
    private TareaDataOnDemand TareasIntegrationTest.dod;
    
    @Test
    public void TareasIntegrationTest.testCountTareas() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", dod.getRandomTarea());
        long count = org.opengis.nix.Tarea.countTareas();
        org.junit.Assert.assertTrue("Counter for 'Tarea' incorrectly reported there were no entries", count > 0);
    }
    
    @Test
    public void TareasIntegrationTest.testFindTarea() {
        org.opengis.nix.Tarea obj = dod.getRandomTarea();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to provide an identifier", id);
        obj = org.opengis.nix.Tarea.findTarea(id);
        org.junit.Assert.assertNotNull("Find method for 'Tarea' illegally returned null for id '" + id + "'", obj);
        org.junit.Assert.assertEquals("Find method for 'Tarea' returned the incorrect identifier", id, obj.getId());
    }
    
    @Test
    public void TareasIntegrationTest.testFindAllTareas() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", dod.getRandomTarea());
        long count = org.opengis.nix.Tarea.countTareas();
        org.junit.Assert.assertTrue("Too expensive to perform a find all test for 'Tarea', as there are " + count + " entries; set the findAllMaximum to exceed this value or set findAll=false on the integration test annotation to disable the test", count < 250);
        java.util.List<org.opengis.nix.Tarea> result = org.opengis.nix.Tarea.findAllTareas();
        org.junit.Assert.assertNotNull("Find all method for 'Tarea' illegally returned null", result);
        org.junit.Assert.assertTrue("Find all method for 'Tarea' failed to return any data", result.size() > 0);
    }
    
    @Test
    public void TareasIntegrationTest.testFindTareaEntries() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", dod.getRandomTarea());
        long count = org.opengis.nix.Tarea.countTareas();
        if (count > 20) count = 20;
        java.util.List<org.opengis.nix.Tarea> result = org.opengis.nix.Tarea.findTareaEntries(0, (int) count);
        org.junit.Assert.assertNotNull("Find entries method for 'Tarea' illegally returned null", result);
        org.junit.Assert.assertEquals("Find entries method for 'Tarea' returned an incorrect number of entries", count, result.size());
    }
    
    @Test
    public void TareasIntegrationTest.testFlush() {
        org.opengis.nix.Tarea obj = dod.getRandomTarea();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to provide an identifier", id);
        obj = org.opengis.nix.Tarea.findTarea(id);
        org.junit.Assert.assertNotNull("Find method for 'Tarea' illegally returned null for id '" + id + "'", obj);
        boolean modified =  dod.modifyTarea(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        obj.flush();
        org.junit.Assert.assertTrue("Version for 'Tarea' failed to increment on flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TareasIntegrationTest.testMerge() {
        org.opengis.nix.Tarea obj = dod.getRandomTarea();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to provide an identifier", id);
        obj = org.opengis.nix.Tarea.findTarea(id);
        boolean modified =  dod.modifyTarea(obj);
        java.lang.Integer currentVersion = obj.getVersion();
        org.opengis.nix.Tarea merged =  obj.merge();
        obj.flush();
        org.junit.Assert.assertEquals("Identifier of merged object not the same as identifier of original object", merged.getId(), id);
        org.junit.Assert.assertTrue("Version for 'Tarea' failed to increment on merge and flush directive", (currentVersion != null && obj.getVersion() > currentVersion) || !modified);
    }
    
    @Test
    public void TareasIntegrationTest.testPersist() {
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", dod.getRandomTarea());
        org.opengis.nix.Tarea obj = dod.getNewTransientTarea(Integer.MAX_VALUE);
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to provide a new transient entity", obj);
        org.junit.Assert.assertNull("Expected 'Tarea' identifier to be null", obj.getId());
        obj.persist();
        obj.flush();
        org.junit.Assert.assertNotNull("Expected 'Tarea' identifier to no longer be null", obj.getId());
    }
    
    @Test
    public void TareasIntegrationTest.testRemove() {
        org.opengis.nix.Tarea obj = dod.getRandomTarea();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to initialize correctly", obj);
        java.lang.Long id = obj.getId();
        org.junit.Assert.assertNotNull("Data on demand for 'Tarea' failed to provide an identifier", id);
        obj = org.opengis.nix.Tarea.findTarea(id);
        obj.remove();
        obj.flush();
        org.junit.Assert.assertNull("Failed to remove 'Tarea' with identifier '" + id + "'", org.opengis.nix.Tarea.findTarea(id));
    }
    
}