<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.3-Madeira" maxScale="0" simplifyDrawingHints="1" labelsEnabled="0" readOnly="0" minScale="1e+08" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 preprocessing="0" enableorderby="0" type="invertedPolygonRenderer" forceraster="0">
    <renderer-v2 enableorderby="0" symbollevels="0" type="singleSymbol" forceraster="0">
      <symbols>
        <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="fill">
          <layer locked="0" pass="0" class="SimpleFill" enabled="1">
            <prop v="3x:0,0,0,0,0,0" k="border_width_map_unit_scale"/>
            <prop v="255,255,255,255" k="color"/>
            <prop v="bevel" k="joinstyle"/>
            <prop v="0,0" k="offset"/>
            <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
            <prop v="MM" k="offset_unit"/>
            <prop v="80,80,80,255" k="outline_color"/>
            <prop v="solid" k="outline_style"/>
            <prop v="3.3" k="outline_width"/>
            <prop v="MapUnit" k="outline_width_unit"/>
            <prop v="solid" k="style"/>
            <data_defined_properties>
              <Option type="Map">
                <Option name="name" value="" type="QString"/>
                <Option name="properties" type="Map">
                  <Option name="outlineWidth" type="Map">
                    <Option name="active" value="true" type="bool"/>
                    <Option name="expression" value="max(@map_scale / 1500, 3.3)" type="QString"/>
                    <Option name="type" value="3" type="int"/>
                  </Option>
                </Option>
                <Option name="type" value="collection" type="QString"/>
              </Option>
            </data_defined_properties>
          </layer>
        </symbol>
      </symbols>
      <rotation/>
      <sizescale/>
    </renderer-v2>
  </renderer-v2>
  <customproperties>
    <property value="objectid" key="dualview/previewExpressions"/>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>0.5</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" scaleDependency="Area" rotationOffset="270" penWidth="0" diagramOrientation="Up" height="15" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" barWidth="5" minimumSize="0" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" width="15" scaleBasedVisibility="0" opacity="1" maxScaleDenominator="1e+08" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" zIndex="0" obstacle="0" placement="1" linePlacementFlags="18" priority="0">
    <properties>
      <Option type="Map">
        <Option name="name" value="" type="QString"/>
        <Option name="properties"/>
        <Option name="type" value="collection" type="QString"/>
      </Option>
    </properties>
  </DiagramLayerSettings>
  <geometryOptions geometryPrecision="0" removeDuplicateNodes="0">
    <activeChecks/>
    <checkConfiguration/>
  </geometryOptions>
  <fieldConfiguration>
    <field name="objectid">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ttwa11cd">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="ttwa11nm">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="st_areasha">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="st_lengths">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="objectid" name="" index="0"/>
    <alias field="ttwa11cd" name="" index="1"/>
    <alias field="ttwa11nm" name="" index="2"/>
    <alias field="st_areasha" name="" index="3"/>
    <alias field="st_lengths" name="" index="4"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="objectid" expression="" applyOnUpdate="0"/>
    <default field="ttwa11cd" expression="" applyOnUpdate="0"/>
    <default field="ttwa11nm" expression="" applyOnUpdate="0"/>
    <default field="st_areasha" expression="" applyOnUpdate="0"/>
    <default field="st_lengths" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="objectid" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="ttwa11cd" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="ttwa11nm" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="st_areasha" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="st_lengths" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="objectid" exp="" desc=""/>
    <constraint field="ttwa11cd" exp="" desc=""/>
    <constraint field="ttwa11nm" exp="" desc=""/>
    <constraint field="st_areasha" exp="" desc=""/>
    <constraint field="st_lengths" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="objectid" width="-1" type="field"/>
      <column hidden="0" name="ttwa11cd" width="-1" type="field"/>
      <column hidden="0" name="ttwa11nm" width="-1" type="field"/>
      <column hidden="0" name="st_areasha" width="-1" type="field"/>
      <column hidden="0" name="st_lengths" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">C:/Users/sbent/OneDrive/Data/PhD/Sheffield_2</editform>
  <editforminit/>
  <editforminitcodesource>0</editforminitcodesource>
  <editforminitfilepath></editforminitfilepath>
  <editforminitcode><![CDATA[# -*- coding: utf-8 -*-
"""
QGIS forms can have a Python function that is called when the form is
opened.

Use this function to add extra logic to your forms.

Enter the name of the function in the "Python Init function"
field.
An example follows:
"""
from qgis.PyQt.QtWidgets import QWidget

def my_form_open(dialog, layer, feature):
	geom = feature.geometry()
	control = dialog.findChild(QWidget, "MyLineEdit")
]]></editforminitcode>
  <featformsuppress>0</featformsuppress>
  <editorlayout>generatedlayout</editorlayout>
  <editable>
    <field editable="1" name="objectid"/>
    <field editable="1" name="orig_ogc_fid"/>
    <field editable="1" name="st_areasha"/>
    <field editable="1" name="st_lengths"/>
    <field editable="1" name="ttwa11cd"/>
    <field editable="1" name="ttwa11nm"/>
  </editable>
  <labelOnTop>
    <field name="objectid" labelOnTop="0"/>
    <field name="orig_ogc_fid" labelOnTop="0"/>
    <field name="st_areasha" labelOnTop="0"/>
    <field name="st_lengths" labelOnTop="0"/>
    <field name="ttwa11cd" labelOnTop="0"/>
    <field name="ttwa11nm" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>objectid</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>2</layerGeometryType>
</qgis>
