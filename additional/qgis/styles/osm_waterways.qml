<!DOCTYPE qgis PUBLIC 'http://mrcc.com/qgis.dtd' 'SYSTEM'>
<qgis version="3.4.3-Madeira" maxScale="0" simplifyDrawingHints="1" labelsEnabled="1" readOnly="0" minScale="1e+06" simplifyAlgorithm="0" styleCategories="AllStyleCategories" hasScaleBasedVisibilityFlag="0" simplifyDrawingTol="1" simplifyLocal="1" simplifyMaxScale="1">
  <flags>
    <Identifiable>1</Identifiable>
    <Removable>1</Removable>
    <Searchable>1</Searchable>
  </flags>
  <renderer-v2 enableorderby="0" symbollevels="0" type="RuleRenderer" forceraster="0">
    <rules key="{43dcac01-4cfe-44d2-ab53-fa98d9e9dc34}">
      <rule scalemindenom="1" label="main river" filter="type IN ('river', 'stream', 'canal')" symbol="0" key="{6c9cb90a-dba5-4d60-81d7-303f0b81446d}" scalemaxdenom="50000"/>
      <rule scalemindenom="1" label="small river" filter="type NOT IN ('river', 'stream', 'canal', 'riverbank', 'building_multipolygon') AND geom IS NULL" symbol="1" key="{f9d048d6-8434-40c4-bfb0-5dc04e5436e8}" scalemaxdenom="25000"/>
    </rules>
    <symbols>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="0" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="184,217,247,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="5" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 2000, 5.0)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
      <symbol alpha="1" clip_to_extent="1" force_rhr="0" name="1" type="line">
        <layer locked="0" pass="0" class="SimpleLine" enabled="1">
          <prop v="square" k="capstyle"/>
          <prop v="5;2" k="customdash"/>
          <prop v="3x:0,0,0,0,0,0" k="customdash_map_unit_scale"/>
          <prop v="MapUnit" k="customdash_unit"/>
          <prop v="0" k="draw_inside_polygon"/>
          <prop v="bevel" k="joinstyle"/>
          <prop v="184,217,247,255" k="line_color"/>
          <prop v="solid" k="line_style"/>
          <prop v="2" k="line_width"/>
          <prop v="MapUnit" k="line_width_unit"/>
          <prop v="0" k="offset"/>
          <prop v="3x:0,0,0,0,0,0" k="offset_map_unit_scale"/>
          <prop v="MapUnit" k="offset_unit"/>
          <prop v="0" k="ring_filter"/>
          <prop v="0" k="use_custom_dash"/>
          <prop v="3x:0,0,0,0,0,0" k="width_map_unit_scale"/>
          <data_defined_properties>
            <Option type="Map">
              <Option name="name" value="" type="QString"/>
              <Option name="properties" type="Map">
                <Option name="outlineWidth" type="Map">
                  <Option name="active" value="true" type="bool"/>
                  <Option name="expression" value="max(@map_scale / 2000, 2.0)" type="QString"/>
                  <Option name="type" value="3" type="int"/>
                </Option>
              </Option>
              <Option name="type" value="collection" type="QString"/>
            </Option>
          </data_defined_properties>
        </layer>
      </symbol>
    </symbols>
  </renderer-v2>
  <labeling type="simple">
    <settings>
      <text-style fieldName="name" fontSizeUnit="MapUnit" textColor="112,133,151,255" fontCapitals="0" fontLetterSpacing="0" fontFamily="Verdana" fontSize="13" previewBkgrdColor="#ffffff" multilineHeight="1" fontUnderline="0" fontWeight="50" textOpacity="1" useSubstitutions="0" fontItalic="0" isExpression="0" namedStyle="Regular" fontSizeMapUnitScale="3x:0,0,0,0,0,0" fontStrikeout="0" fontWordSpacing="0" blendMode="0">
        <text-buffer bufferColor="255,255,255,255" bufferNoFill="0" bufferSizeMapUnitScale="3x:0,0,0,0,0,0" bufferSize="4" bufferDraw="1" bufferBlendMode="0" bufferOpacity="0.5" bufferSizeUnits="MapUnit" bufferJoinStyle="128"/>
        <background shapeSVGFile="" shapeBorderColor="128,128,128,255" shapeOffsetMapUnitScale="3x:0,0,0,0,0,0" shapeBorderWidthUnit="MM" shapeSizeMapUnitScale="3x:0,0,0,0,0,0" shapeRadiiY="0" shapeRadiiUnit="MM" shapeOpacity="1" shapeRadiiX="0" shapeDraw="0" shapeOffsetX="0" shapeSizeUnit="MM" shapeRotation="0" shapeRadiiMapUnitScale="3x:0,0,0,0,0,0" shapeJoinStyle="64" shapeSizeX="0" shapeOffsetUnit="MM" shapeType="0" shapeRotationType="0" shapeSizeType="0" shapeBorderWidth="0" shapeOffsetY="0" shapeSizeY="0" shapeFillColor="255,255,255,255" shapeBorderWidthMapUnitScale="3x:0,0,0,0,0,0" shapeBlendMode="0"/>
        <shadow shadowDraw="0" shadowOffsetMapUnitScale="3x:0,0,0,0,0,0" shadowRadiusUnit="MM" shadowOffsetUnit="MM" shadowColor="0,0,0,255" shadowOffsetDist="1" shadowRadius="1.5" shadowRadiusAlphaOnly="0" shadowRadiusMapUnitScale="3x:0,0,0,0,0,0" shadowOffsetAngle="135" shadowOpacity="0.7" shadowScale="100" shadowOffsetGlobal="1" shadowUnder="0" shadowBlendMode="6"/>
        <substitutions/>
      </text-style>
      <text-format addDirectionSymbol="0" leftDirectionSymbol="&lt;" formatNumbers="0" wrapChar="" useMaxLineLengthForAutoWrap="1" multilineAlign="0" rightDirectionSymbol=">" decimals="0" reverseDirectionSymbol="0" placeDirectionSymbol="0" autoWrapLength="0" plussign="0"/>
      <placement fitInPolygonOnly="0" centroidWhole="0" dist="0" repeatDistanceMapUnitScale="3x:0,0,0,0,0,0" distUnits="MM" quadOffset="4" predefinedPositionOrder="TR,TL,BR,BL,R,L,TSR,BSR" offsetType="0" maxCurvedCharAngleOut="-20" repeatDistance="0" repeatDistanceUnits="MM" xOffset="0" yOffset="0" maxCurvedCharAngleIn="20" centroidInside="0" placement="3" preserveRotation="1" rotationAngle="0" distMapUnitScale="3x:0,0,0,0,0,0" priority="5" placementFlags="9" labelOffsetMapUnitScale="3x:0,0,0,0,0,0" offsetUnits="MapUnit"/>
      <rendering scaleMin="1" fontMinPixelSize="3" drawLabels="1" zIndex="0" maxNumLabels="2000" upsidedownLabels="0" obstacleFactor="1" labelPerPart="0" obstacle="1" mergeLines="1" obstacleType="0" minFeatureSize="0" limitNumLabels="0" scaleMax="50000" fontLimitPixelSize="0" displayAll="0" fontMaxPixelSize="10000" scaleVisibility="0"/>
      <dd_properties>
        <Option type="Map">
          <Option name="name" value="" type="QString"/>
          <Option name="properties"/>
          <Option name="type" value="collection" type="QString"/>
        </Option>
      </dd_properties>
    </settings>
  </labeling>
  <customproperties>
    <property value="0" key="embeddedWidgets/count"/>
    <property key="variableNames"/>
    <property key="variableValues"/>
  </customproperties>
  <blendMode>0</blendMode>
  <featureBlendMode>0</featureBlendMode>
  <layerOpacity>1</layerOpacity>
  <SingleCategoryDiagramRenderer diagramType="Histogram" attributeLegend="1">
    <DiagramCategory penAlpha="255" sizeScale="3x:0,0,0,0,0,0" sizeType="MM" enabled="0" scaleDependency="Area" rotationOffset="270" penWidth="0" diagramOrientation="Up" height="15" minScaleDenominator="0" lineSizeScale="3x:0,0,0,0,0,0" penColor="#000000" barWidth="5" minimumSize="0" labelPlacementMethod="XHeight" backgroundColor="#ffffff" lineSizeType="MM" width="15" scaleBasedVisibility="0" opacity="1" maxScaleDenominator="1e+08" backgroundAlpha="255">
      <fontProperties style="" description="MS Shell Dlg 2,9.6,-1,5,50,0,0,0,0,0"/>
      <attribute field="" color="#000000" label=""/>
    </DiagramCategory>
  </SingleCategoryDiagramRenderer>
  <DiagramLayerSettings dist="0" showAll="1" zIndex="0" obstacle="0" placement="2" linePlacementFlags="18" priority="0">
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
    <field name="id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="geom">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="osm_id">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="name">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
    <field name="type">
      <editWidget type="TextEdit">
        <config>
          <Option/>
        </config>
      </editWidget>
    </field>
  </fieldConfiguration>
  <aliases>
    <alias field="id" name="" index="0"/>
    <alias field="geom" name="" index="1"/>
    <alias field="osm_id" name="" index="2"/>
    <alias field="name" name="" index="3"/>
    <alias field="type" name="" index="4"/>
  </aliases>
  <excludeAttributesWMS/>
  <excludeAttributesWFS/>
  <defaults>
    <default field="id" expression="" applyOnUpdate="0"/>
    <default field="geom" expression="" applyOnUpdate="0"/>
    <default field="osm_id" expression="" applyOnUpdate="0"/>
    <default field="name" expression="" applyOnUpdate="0"/>
    <default field="type" expression="" applyOnUpdate="0"/>
  </defaults>
  <constraints>
    <constraint field="id" constraints="3" exp_strength="0" notnull_strength="1" unique_strength="1"/>
    <constraint field="geom" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="osm_id" constraints="1" exp_strength="0" notnull_strength="1" unique_strength="0"/>
    <constraint field="name" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
    <constraint field="type" constraints="0" exp_strength="0" notnull_strength="0" unique_strength="0"/>
  </constraints>
  <constraintExpressions>
    <constraint field="id" exp="" desc=""/>
    <constraint field="geom" exp="" desc=""/>
    <constraint field="osm_id" exp="" desc=""/>
    <constraint field="name" exp="" desc=""/>
    <constraint field="type" exp="" desc=""/>
  </constraintExpressions>
  <expressionfields/>
  <attributeactions>
    <defaultAction value="{00000000-0000-0000-0000-000000000000}" key="Canvas"/>
  </attributeactions>
  <attributetableconfig sortExpression="" actionWidgetStyle="dropDown" sortOrder="0">
    <columns>
      <column hidden="0" name="id" width="-1" type="field"/>
      <column hidden="0" name="geom" width="-1" type="field"/>
      <column hidden="0" name="osm_id" width="-1" type="field"/>
      <column hidden="0" name="name" width="-1" type="field"/>
      <column hidden="0" name="type" width="-1" type="field"/>
      <column hidden="1" width="-1" type="actions"/>
    </columns>
  </attributetableconfig>
  <conditionalstyles>
    <rowstyles/>
    <fieldstyles/>
  </conditionalstyles>
  <editform tolerant="1">C:/PROGRA~1/QGIS3~1.4/bin</editform>
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
    <field editable="1" name="geom"/>
    <field editable="1" name="id"/>
    <field editable="1" name="name"/>
    <field editable="1" name="osm_id"/>
    <field editable="1" name="type"/>
  </editable>
  <labelOnTop>
    <field name="geom" labelOnTop="0"/>
    <field name="id" labelOnTop="0"/>
    <field name="name" labelOnTop="0"/>
    <field name="osm_id" labelOnTop="0"/>
    <field name="type" labelOnTop="0"/>
  </labelOnTop>
  <widgets/>
  <previewExpression>name</previewExpression>
  <mapTip></mapTip>
  <layerGeometryType>1</layerGeometryType>
</qgis>
